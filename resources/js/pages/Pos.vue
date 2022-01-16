<template>
    <div >
        <div class="page-wrapper" style="min-height: 905px;">
            <div class="container-fluid">
        <div class=" row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">Dashboard 1</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-end">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb justify-content-end">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active">Pos</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="row">
                   <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <input type="text" v-model="SearchPro" @keyup.enter="GetAllStore()" class="form-control" placeholder="ຄົ້ນຫາ...">

                            </div>
                        </div>

                        

                        <div class="row" style="height: 67vh; overflow: auto;">
                                    <div v-for="list in ProductData.data" :key="list.id" class="col-6 col-lg-3 col-md-6">
                                        <div class="card cursor-pointer" @click="AddToOrder(list.id)">
                                            <span v-for="listorder in ListOrder" :key="listorder.index">
                                                <span class="bg-success p-2" v-if="list.id==listorder.id" style="position: absolute; right: 0px; top: 0px; border-bottom-left-radius: 8px; color: #FFF; font-size: 18px;">{{listorder.order_amount}}</span>
                                            </span>
                                            
                                            <img :src="urlLocaltion+'/assets/images/'+list.images" class="card-img-top img-responsive" style=" width:100%; height: 140px; object-fit: cover; object-position: center;" v-if="list.images" />
                                            <img :src="urlLocaltion+'/assets/images/no_images.jpg'" class="card-img-top img-responsive" style=" width:100%; height: 140px; object-fit: cover; object-position: center;" v-if="!list.images" />
                                            <div class="card-body p-2 text-center">
                                                <p class="card-text">{{list.name}}</p>
                                                <p class="card-text text-info"> {{formatPrice(list.price_sell)}} ກີບ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body" >
                                <h4 class="card-title text-info d-flex justify-content-between">  <span> <strong> ລວມຍອດເງິນ: </strong></span> <span><strong>{{formatPrice(totalAmount)}} ກີບ</strong></span>  </h4>
                                <button type="button" @click="BtPay" :disabled="checkPay" style="width:100%" class="btn btn-success text-white mb-2"> <i class="mdi mdi-currency-usd"></i> ຊຳລະເງິນ</button>
                                <div class="table-responsive" style="height: 65vh; overflow: auto;">
                                <table class="table color-table muted-table border">
                                        <thead>
                                            <tr>
                                                <th>ລາຍການ</th>
                                                <th width="120" class="text-center">ລາຄາ</th>
                                                <th width="130" class="text-end">ຍອດລວມ (<i @click="DelAll()" class="mdi mdi-close-circle text-danger cursor-pointer"></i>)</th>
                                            </tr>
                                        </thead>
                                        <tbody >
                                            <tr v-for="list in ListOrder" :key="list.id">
                                                <td>{{list.name}}</td>
                                                <td class="text-end">
                                                    {{formatPrice(list.price_sell)}} ກີບ <br>
                                                   <i @click="DelOr(list.id)" class="mdi mdi-minus-circle text-info cursor-pointer"></i> {{list.order_amount}} <i @click="AddOr(list.id)" class="mdi mdi-plus-circle text-info cursor-pointer"></i> |
                                                   <i @click="DelOne(list.id)" class="mdi mdi-close-circle text-danger cursor-pointer"></i>
                                                </td>
                                                <td class="text-end"> {{formatPrice(list.price_sell*list.order_amount)}} ກີບ </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="modal-pay" class="modal" tabindex="-1" style="display: none;" aria-hidden="true"  >
                                    <div class="modal-dialog" >
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">ຊຳລ່ະເງິນ</h4>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                                            </div>
                                            <div class="modal-body">
                                               <h4 class="card-title text-info d-flex justify-content-between">  <span> <strong> ລວມຍອດເງິນ: </strong></span> <span><strong>{{formatPrice(totalAmount)}} ກີບ</strong></span>  </h4>
                                               <h4 class="card-title text-info d-flex justify-content-between">  <span> <strong> ຮັບເງິນນຳລູກຄ້າ: </strong></span> <span><strong>{{formatPrice(CashAmount)}} ກີບ</strong></span>  </h4>
                                               <h4 class="card-title text-danger d-flex justify-content-between" v-if="CashBack>0">  <span> <strong> ເງິນທອນ: </strong></span> <span><strong>{{formatPrice(CashBack)}} ກີບ</strong></span>  </h4>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" v-model="CashAmount" style="text-align:right;" >
                                                    </div>
                                                 <div class="p-2 justify-content-center d-flex">
                <div class="row" style="width:250px">
                  <div class="col-4 text-center  mt-2">
                    <a  class="btn btn-primary btn-lg text-white" @click="AddNum(1)" style="width:60px">1</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum(2)" style="width:60px">2</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum(3)" style="width:60px">3</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum(4)" style="width:60px">4</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum(5)" style="width:60px">5</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <button type="button" class="btn btn-primary btn-lg text-white" @click="AddNum(6)" style="width:60px">6</button>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum(7)" style="width:60px">7</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum(8)" style="width:60px">8</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum(9)" style="width:60px">9</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum('00')" style="width:60px">00</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a class="btn btn-primary btn-lg text-white" @click="AddNum(0)" style="width:60px">0</a>
                  </div>
                  <div class="col-4 text-center mt-2">
                    <a  class="btn btn-danger btn-lg text-white" @click="AddNum('-')" style="width:60px"><i class="fas fa-long-arrow-alt-left"></i></a>
                  </div>
                </div>
              </div>
              <div class="row justify-content-center d-flex mt-2 text-center">
                <button type="button" class="btn btn-success" @click="ConfirmPay"  style="width:180px;" :disabled="CheckCPay"><i class="fas fa-coins"></i> ບືນຍັນຊຳລ່ະເງິນ </button>
              </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default waves-effect" data-bs-dismiss="modal">ປິດ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

    </div>
</template>

<script>
export default {
    name: 'Myapp2Pos',

    data() {
        return {
            ProductData: [],
            SearchPro:'',
            urlLocaltion: window.location.origin,
            ListOrder:[],
            CashAmount:'',
        };
    },

    mounted() {

    },
    computed:{
        totalAmount() {
            return this.ListOrder.reduce(
                (num, item) => num + item.price_sell * item.order_amount,
                0
            );
            },
            checkPay(){
                if(this.totalAmount>0){ return false } else { return true }
            },
            CashBack(){
                return parseInt(this.CashAmount)-parseInt(this.totalAmount)
            },
            CheckCPay(){
                if((parseInt(this.CashAmount)-parseInt(this.totalAmount))>=0){
                    return false
                } else { return true }
            }


    },
    methods: {
    ConfirmPay(){

            this.$axios.get("/sanctum/csrf-cookie").then((response) => {
          axios.post("/api/transection/add",{
              acc_type:'income',
              listorder: this.ListOrder
          })
            .then((response) => {
              if (response.data.success) {
                $('#modal-pay').modal('hide');
                this.ListOrder = [];
                this.CashAmount = '';
                this.GetAllStore();
              } else {
                console.log(response.data.message);
              }
            })
            .catch((error) => {
              console.log(error);
            });
        });
    },
    AddNum(num){
         if(num=='-'){ 
                        this.CashAmount = this.CashAmount.slice(0, -1)
                    } else {
                        this.CashAmount = this.CashAmount+num
                    }
    },
    BtPay(){
        $('#modal-pay').modal('show');
        //
    },
    AddOr(id){
        let item = this.ProductData.data.find((i)=>i.id==id);
        if(this.ListOrder.find((i)=>i.id==id)){
                        let old_order_amount = this.ListOrder.find((i)=>i.id==id).order_amount;
                        if((item.amount-old_order_amount)>0){
                            this.ListOrder.find((i)=>i.id==id).order_amount = old_order_amount+1;
                        } else { console.log('loss!')}
                   }
    },
    DelOr(id){
        let item = this.ProductData.data.find((i)=>i.id==id);
         if(this.ListOrder.find((i)=>i.id==id)){
                        let old_order_amount = this.ListOrder.find((i)=>i.id==id).order_amount;
                        if((old_order_amount-1)>0){
                            this.ListOrder.find((i)=>i.id==id).order_amount = old_order_amount-1;
                        } else {
                            this.ListOrder.splice(this.ListOrder.map(i=>i.id).indexOf(id),1);
                        }
                   }

    },
    DelOne(id){
        this.ListOrder.splice(this.ListOrder.map(i=>i.id).indexOf(id),1);
    },
    DelAll(){
        this.ListOrder = [];
    },
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(",", ".");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
    AddToOrder(id){

            let item = this.ProductData.data.find((i)=>i.id==id);
            if(this.ListOrder.find((i)=>i.id==id)){
                        let old_order_amount = this.ListOrder.find((i)=>i.id==id).order_amount;
                        if((item.amount-old_order_amount)>0){
                            this.ListOrder.find((i)=>i.id==id).order_amount = old_order_amount+1;
                        } else { console.log('loss!')}
                   } else {
                       if(item.amount>0){
                            this.ListOrder.push({
                                id: item.id,
                                name: item.name,
                                price_sell: item.price_sell,
                                order_amount: 1
                            });
                        } else { console.log('loss!')}
                   }


    },
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(",", ".");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
        GetAllStore(){
             this.$axios.get("/sanctum/csrf-cookie").then((response) => {
                axios.get(`/api/store/pos?s=${this.SearchPro}`)
                    .then((response) => {
                        this.ProductData = response.data;
                    })
                    .catch((error) => {
                        console.log(error);
                    })
                });
    },
    },
    beforeRouteEnter(to, from, next) {
    if (!window.Laravel.isLoggedin) {
      window.location.href = "/login";
    }
    next();
  },
  created(){
      this.$axios.get(`/api/users/checkauth`).then((response) => {
        if (!response.data.isLogin) {
            window.location.href = "/";
        }
        });
        this.GetAllStore();
  },
  watch:{
      SearchPro(){
          if(this.SearchPro==''){
              this.GetAllStore()
          }
      }
  }
};
</script>

<style lang="scss" scoped>

</style>