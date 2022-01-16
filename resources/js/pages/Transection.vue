<template>
  <div>
    <div class="page-wrapper" style="min-height: 905px;">
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
            <li class="breadcrumb-item active">Transection</li>
          </ol>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <h4 class="card-title">ການເຄື່ອນໄຫວ</h4>
              <div class="text-end">
                  <div class="btn-group me-2" role="group" aria-label="Basic example" >
                    <button type="button" class="btn btn-secondary" @click="monthtype = 'm'" > <i class="mdi mdi-menu-right" v-if="monthtype == 'm'"></i> ເດືອນ </button>
                    <button type="button" class="btn btn-secondary" @click="monthtype = 'y'" > <i class="mdi mdi-menu-right" v-if="monthtype == 'y'"></i> ປີ </button>
                  </div>
                  <input type="date" style="width: 180px" v-model="dmy" class="form-control me-2" /> 
                  <button class="btn btn-success text-white me-2" @click="GetAllTran()" >
                    <i class="mdi mdi-view-list"></i> ສະແດງການເຄື່ອນໄຫວ
                  </button>
                </div>
            </div>
            <div class="table-responsive mt-4">
              <table class="table color-table info-table border">
                <thead>
                  <tr>
                    <th width="120">ວັນທີ່</th>
                    <th width="120">ເລກທີ່ທຸລະກຳ</th>
                    <th width="120">ປະເພດທຸລະກຳ</th>
                    <th>ລາຍລະອຽດ</th>
                    <th width="150" class="text-center">ມູນຄ່າ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="list in Transection.data" :key="list.id">
                    <td>{{date(list.created_at)}}</td>
                    <td>{{list.tran_id}}</td>
                    <td> {{list.tran_type}} </td>
                    <td> {{list.tran_detail}}</td>
                    <td class="text-end">
                      {{formatPrice(list.price)}} ກີບ
                    </td>
                  </tr>

                </tbody>
              </table>
              <pagination :pagination="Transection" @paginate="GetAllTran($event)" :offset="4"></pagination>
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

import moment from "moment";

export default {
  name: "Myapp2Transection",

  data() {
    return {
      Transection:[],
      monthtype: "y",
      dmy: "",
    };
  },

  mounted() {},

  methods: {
    date(value) {
      return moment(value).format("DD/MM/YYYY");
    },
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(",", ".");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
    GetAllTran(page){
             this.$axios.get("/sanctum/csrf-cookie").then((response) => {
                axios.post(`/api/transection?page=${page}`,{
                  monthtype:this.monthtype,
                  dmy:this.dmy
                })
                    .then((response) => {
                        this.Transection = response.data;
                    })
                    .catch((error) => {
                        console.log(error);
                    })
                });
    }
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
        this.GetAllTran();
  }
};
</script>

<style>
</style>