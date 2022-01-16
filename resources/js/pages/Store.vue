<template>
  <div>
    <div class="page-wrapper" style="min-height: 905px">
      <div class="container-fluid">
        <div class="row page-titles">
          <div class="col-md-5 align-self-center">
            <h4 class="text-themecolor">Dashboard 1</h4>
          </div>
          <div class="col-md-7 align-self-center text-end">
            <div class="d-flex justify-content-end align-items-center">
              <ol class="breadcrumb justify-content-end">
                <li class="breadcrumb-item">
                  <a href="javascript:void(0)">Home</a>
                </li>
                <li class="breadcrumb-item active">Store</li>
              </ol>
            </div>
          </div>
        </div>

        <dashqrap/>


        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="d-flex">
                  <div>
                    <h3 class="card-title">ລາຍການ ສະຕ໋ອກສິນຄ້າ</h3>
                  </div>
                  <div class="ms-auto">
                    <button
                      type="button"
                      class="btn btn-success text-white me-2"
                      @click="AddNew()"
                      v-if="!FormShow"
                    >
                      <i class="ti ti-plus"></i> ເພີ່ມໃໝ່
                    </button>
                    <button
                      type="button"
                      class="btn btn-info text-white me-2"
                      :class="checkForm"
                      v-if="FormShow"
                      @click="SaveForm()"
                    >
                      <i class="ti ti-save"></i> ບັນທຶກ
                    </button>
                    <button
                      type="button"
                      class="btn btn-danger text-white"
                      v-if="FormShow"
                      @click="Cancel()"
                    >
                      <i class="ti ti-close"></i> ຍົກເລີກ
                    </button>
                  </div>
                </div>

              <div class="from-add p-4 row" v-if="FormShow">
                <div class="col-md-4 text-center">
                  <img
                    :src="imagesPreview"
                    class="img-responsive radius"

                  />
                  <input type="file" name="file" class="form-control mt-2" @change="onSelected">
                </div>
                <div class="col-md-8">
                  <div class="form-group">
                    <label class="form-label">ຊື່ສິນຄ້າ</label>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="..."
                      v-model="FormProduct.name"
                    />
                  </div>
                  <div class="form-group">
                    <label class="form-label">ຈຳນວນ</label>
                    <cleave
                    :options="option"
                      class="form-control"
                      placeholder="..."
                      v-model="FormProduct.amount"
                    />
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label">ລາຄາຊື້</label>
                        <cleave :options="option"
                          class="form-control"
                          placeholder="..."
                          v-model="FormProduct.price_buy"
                        />
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label">ລາຄາຂາຍ</label>
                        <cleave :options="option"
                          class="form-control"
                          placeholder="..."
                          v-model="FormProduct.price_sell"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>


            <div v-if="!FormShow">


            <div class="row mt-2">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <div class="input-group mb-3">
                    <input type="text" v-model="SearchPro" @keyup.enter="GetAllStore()" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ຄົ້ນຫາຂໍ້ມູນ...">

            </div>
                </div>
            </div>

              <div class="table-responsive" >

                <table
                  class=" color-table purple-table
                    table table-hover
                    no-wrap
                    footable footable-1 footable-paging footable-paging-center border
                  "
                >
                  <thead>
                    <tr>
                      <th width="40" class="text-center">#</th>
                      <th width="150">ຮູບສິນຄ້າ</th>
                      <th>ຊື່ສິນຄ້າ</th>
                      <th width="50" class="text-center">ຈຳນວນ</th>
                      <th width="180" class="text-end">ລາຄາຊື້</th>
                      <th width="50" class="text-center">ຈັດການ</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="list in FormData.data" :key="list.id">
                      <td class="text-center">{{ list.id }}</td>
                      <td width="150">
                        <img :src="urlLocaltion+'/assets/images/'+list.images" class="img-responsive radius" v-if="list.images" style=" width:100%; height: 80px; object-fit: cover; object-position: center;" />
                        <img :src="urlLocaltion+'/assets/images/no_images.jpg'" class="img-responsive radius" v-if="!list.images" style=" width:100%; height: 80px; object-fit: cover; object-position: center;" />
                      </td>
                      <td>
                        {{
                          list.name
                        }}
                      </td>
                      <td class="text-center">{{ list.amount }}</td>
                      <td class="text-end">
                        <span class="text-success">{{
                          formatPrice(list.price_buy)
                        }} ກີບ</span>
                      </td>
                      <td class="text-center">
                        <button
                          class="
                            pull-right
                            btn btn-circle btn-info
                            text-white
                            me-2
                          "
                          @click="EditProduct(list.id)"
                        >
                          <i class="ti-pencil"></i>
                        </button>
                        <button
                          class="
                            pull-right
                            btn btn-circle btn-danger
                            text-white
                          "
                          @click="DelProduct(list.id)"
                        >
                          <i class="ti-trash"></i>
                        </button>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <pagination :pagination="FormData" @paginate="GetAllStore($event)" :offset="4">
                </pagination>
              </div>
              </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>


export default {
  name: "Home",
  components:{

  },
  data() {
    return {

      FormData: [],
      FormShow: false, //  ສະແດງແບບຟອມ
      FormType: true, // ປະເພດຂອງຟອມ true = ບັນທຶກໃໝ່, false = ອັບເດດ
      FormID: "", // id ສຳລັບອັບເດດ
      FormProduct: {
        name: "",
        amount: "",
        price_buy: "",
        price_sell: "",
      },
      imagesPro:'',
      urlLocaltion: window.location.origin,
      imagesPreview: window.location.origin+"/assets/images/add_images.png",
      SearchPro:'',
      option:{
         // prefix: '$ ',
          numeral: true,
          numeralPositiveOnly: true,
          noImmediatePrefix: true,
          rawValueTrimPrefix: true,
          numeralIntegerScale: 10,
          numeralDecimalScale: 2,
          numeralDecimalMark: '.',
          delimiter: ','
        },
    };
  },

  computed: {
    checkForm() {
      if (
        this.FormProduct.name == "" ||
        this.FormProduct.amount == "" ||
        this.FormProduct.price_buy == "" ||
        this.FormProduct.price_sell == ""
      ) {
        return "disabled";
      } else {
        return "";
      }
    },
  },
  methods: {
    GetAllStore(page){
             this.$axios.get("/sanctum/csrf-cookie").then((response) => {
                axios.get(`/api/store?page=${page}&s=${this.SearchPro}`)
                    .then((response) => {
                        this.FormData = response.data;
                    })
                    .catch((error) => {
                        console.log(error);
                    })
                });
    },
    AddNew() {
      this.FormShow = true;
      this.imagesPro = "";
      this.imagesPreview = window.location.origin+"/assets/images/add_images.png";
    },
    Cancel() {
      this.FormProduct.name = "";
      this.FormProduct.amount = "";
      this.FormProduct.price_buy = "";
      this.FormProduct.price_sell = "";
      this.imagesPro = "";
      this.FormShow = false;
    },
    SaveForm() {
      //console.log(this.FromProduct)

      if (this.FormType) {
        // ບັນທຶກໃໝ່

        //
        // this.FromData.push({
        //     id: Math.floor(Math.random() * 1000),
        //     name:this.FromProduct.name,
        //     amount: this.FromProduct.amount,
        //     price_buy: this.FromProduct.price_buy,
        //     price_sell: this.FromProduct.price_sell
        // });

        this.$axios.get("/sanctum/csrf-cookie").then((response) => {
            let formData = new FormData();
            formData.append('name', this.FormProduct.name);
            formData.append('amount', this.FormProduct.amount);
            formData.append('price_buy', this.FormProduct.price_buy);
            formData.append('price_sell', this.FormProduct.price_sell);
            formData.append('file', this.imagesPro);
          axios.post("/api/store/add", formData ,{headers:{ "Content-Type": "multipart/form-data"}})
            .then((response) => {
              if (response.data.success) {
                this.GetAllStore()
                this.FormProduct.name = "";
                this.FormProduct.amount = "";
                this.FormProduct.price_buy = "";
                this.FormProduct.price_sell = "";
                this.imagesPro = "";
                this.FormShow = false;
              } else {
                console.log(response.data.message);
              }
            })
            .catch((error) => {
              console.log(error);
            });
        });


      } else {
        // ອັບເດດ

        // var item = {...}
        // var items = [{id:2}, {id:2}, {id:2}];
        // var foundItem = items.filter((x) => x.id ==  item.id).pop();
        // foundItem = item;

        /// update array
        // this.FromData.find((i)=>i.id==this.FromID).name = this.FromProduct.name
        // this.FromData.find((i)=>i.id==this.FromID).amount = this.FromProduct.amount
        // this.FromData.find((i)=>i.id==this.FromID).price_buy = this.FromProduct.price_buy
        // this.FromData.find((i)=>i.id==this.FromID).price_sell = this.FromProduct.price_sell

        this.$axios.get("/sanctum/csrf-cookie").then((response) => {
            let formData = new FormData();
            formData.append('name', this.FormProduct.name);
            formData.append('amount', this.FormProduct.amount);
            formData.append('price_buy', this.FormProduct.price_buy);
            formData.append('price_sell', this.FormProduct.price_sell);
            formData.append('file', this.imagesPro);
          axios.post(`/api/store/update/${this.FormID}`, formData ,{headers:{ "Content-Type": "multipart/form-data"}})
            .then((response) => {
              if (response.data.success) {
                this.GetAllStore();
                this.FormShow = false;
                this.FormType = true;
                this.FormID = "";
                this.FormProduct.name = "";
                this.FormProduct.amount = "";
                this.FormProduct.price_buy = "";
                this.FormProduct.price_sell = "";
                this.imagesPro = "";
              } else {
                console.log(response.data.message);
              }
            })
            .catch((error) => {
              console.log(error);
            });
        });



      }
    },
    EditProduct(id) {
      // console.log('ແກ້ໄຂ ID:'+id)
      this.FormShow = true;
      this.FormType = false;
      this.FormID = id;
      //    let item = this.FromData.find((i)=>i.id == id);
      //    console.log(item.id+ ' - '+ item.name+' - '+ item.amount)

      this.$axios.get("/sanctum/csrf-cookie").then((response) => {
                axios.get(`/api/store/edit/${id}`)
                    .then((response) => {
                        //this.FormData = response.data;

                        this.FormProduct.name = response.data.name;
                        this.FormProduct.amount = response.data.amount;
                        this.FormProduct.price_buy = response.data.price_buy;
                        this.FormProduct.price_sell = response.data.price_sell;
                        //this.imagesPro = response.data.images;
                        if(response.data.images){
                            this.imagesPreview = window.location.origin+"/assets/images/"+response.data.images;
                        } else {
                            this.imagesPreview = window.location.origin+"/assets/images/no_images.jpg";
                        }


                    })
                    .catch((error) => {
                        console.log(error);
                    })
                });


    },
    DelProduct(id) {
      //  console.log('ລຶບ ID:'+id)
      // ຄົ້ນຫາ id ຂອງລາຍການ ໂດຍນິຍາມ i.id ໃຊ້ຟັງຊັ່ນ map ຄົ້ນຫາ ແລະ ຈັບໂຕແປ ໂດຍປຽບທຽບກັບ id ຈາກຟັງຊັ່ນ indexOf ຈະໄດ້ index
     // let index = this.FormData.map((i) => i.id).indexOf(id);
     // this.FormData.splice(index, 1); //ແລະນຳເອົາໂຕເລກ index ໄປລຶບອອກໂດຍ ຟັງຊັ່ນ splice
      // ຂຽນແບບຫຍໍ້ໆ this.FromData.splice(this.FromData.map(i=>i.id).indexOf(id),1)

    alert('ລະບົບ ທົດຊອບ ບໍ່ອານຸຍາດໃຫ້ລຶບຂໍ້ມູນ!')
        // this.$axios.get("/sanctum/csrf-cookie").then((response) => {
        //         axios.delete(`/api/store/delete/${id}`)
        //             .then((response) => {
        //                 //this.FormData = response.data;
        //                 if (response.data.success) {
        //                     this.GetAllStore();
        //                 }
        //             })
        //             .catch((error) => {
        //                 console.log(error);
        //             })
        //         });

    },
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(",", ".");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
     onSelected(event) {
      this.imagesPro = event.target.files[0];
      let reader = new FileReader();
      reader.readAsDataURL(this.imagesPro);
      reader.addEventListener( "load", function () { this.imagesPreview = reader.result; }.bind(this), false );

    },
  },
  created(){
      this.GetAllStore()

         this.$axios.get(`/api/users/checkauth`).then((response) => {
        if (!response.data.isLogin) {
            window.location.href = "/";
        }
        });

  },
  watch: {
       SearchPro(){
          if(this.SearchPro==''){
              this.GetAllStore()
          }
      }
    //   imagesPro(){
    //         if(this.imagesPro==''){
    //             this.imagesPreview = window.location.origin+"/assets/images/add_images.png";
    //         } else {
    //             this.imagesPreview = window.location.origin+"/assets/images/"+this.imagesPro;
    //         }
    //   }
  },
  beforeRouteEnter(to, from, next) {
    if (!window.Laravel.isLoggedin) {
      window.location.href = "/login";
    }
    next();
  },
};
</script>

<style></style>