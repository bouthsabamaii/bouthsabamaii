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
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active">User</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h4 class="card-title">ຈັດການຜູ້ໃຊ້</h4>
                                    <div class="ms-auto"><button type="button" class="btn btn-success text-white me-2"><i class="ti ti-plus"></i> ເພີ່ມໃໝ່</button><button type="button" class="btn btn-info text-white me-2"><i class="ti ti-save"></i> ບັນທຶກ</button><button type="button" class="btn btn-danger text-white"><i class="ti ti-close"></i> ຍົກເລີກ</button></div>
                                </div>
                                
                                <div class="from-add p-4 row">
                                <div class="col-md-4">
                                        <img src="assets/images/big/img4.jpg" class="img-responsive radius">
                                </div>
                                <div class="col-md-8">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                    <label class="form-label">ຊື່ຜູ້ໃຊ້</label>
                                                    <input type="text"  class="form-control" placeholder="...">
                                                    </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                                <div class="form-group">
                                                    <label class="form-label">ອີເມວລ໌</label>
                                                    <input type="text"  class="form-control" placeholder="...">
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                    <label class="form-label">ລະຫັດຜ່ານ</label>
                                                    <input type="password"  class="form-control" placeholder="...">
                                                    </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                                <div class="form-group">
                                                    <label class="form-label">ຍືນຍັນລະຫັດ</label>
                                                    <input type="password"  class="form-control" placeholder="...">
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                    <label class="form-label">ປະເພດຜູ້ໃຊ້</label>
                                                    <select class="form-select ">
                                                    <option selected="">ເລືອກ...</option>
                                                    <option value="admin">Admin</option>
                                                    <option value="user">User</option>
                                                </select>
                                                    </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                                <div class="form-group">
                                                    <label class="form-label">ສະຖານະ</label>
                                                    <select class="form-select ">
                                                    <option selected="">ເລືອກ...</option>
                                                    <option value="1">Active</option>
                                                    <option value="0">Deactive</option>
                                                </select>
                                                    </div>
                                                        </div>
                                                    </div>
                                    
                                </div>
                                
                            </div>
                                <div class="table-responsive mt-4">
                                    <table class="table color-table purple-table border">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>ຊື່ຜູ້ໃຊ້</th>
                                                <th>ອີເມວລ໌</th>
                                                <th>ປະເພດຜູ້ໃຊ້</th>
                                                <th>ສະຖານະ</th>
                                                <th width="150" class="text-center">ຈັດການ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Sone</td>
                                                <td>sone@mail.com</td>
                                                <td>Admin</td>
                                                <td>Active</td>
                                                <td class="text-center">
                                                    <button class="pull-right btn btn-circle btn-info text-white me-2" ><i class="ti-pencil"></i></button>
                                                <button class="pull-right btn btn-circle btn-danger text-white" ><i class="ti-trash"></i></button>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>1</td>
                                                <td>Sone</td>
                                                <td>sone@mail.com</td>
                                                <td>Admin</td>
                                                <td>Active</td>
                                                <td class="text-center">
                                                    <button class="pull-right btn btn-circle btn-info text-white me-2" ><i class="ti-pencil"></i></button>
                                                <button class="pull-right btn btn-circle btn-danger text-white" ><i class="ti-trash"></i></button>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>1</td>
                                                <td>Sone</td>
                                                <td>sone@mail.com</td>
                                                <td>Admin</td>
                                                <td>Active</td>
                                                <td class="text-center">
                                                    <button class="pull-right btn btn-circle btn-info text-white me-2" ><i class="ti-pencil"></i></button>
                                                <button class="pull-right btn btn-circle btn-danger text-white" ><i class="ti-trash"></i></button>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>1</td>
                                                <td>Sone</td>
                                                <td>sone@mail.com</td>
                                                <td>Admin</td>
                                                <td>Active</td>
                                                <td class="text-center">
                                                    <button class="pull-right btn btn-circle btn-info text-white me-2" ><i class="ti-pencil"></i></button>
                                                <button class="pull-right btn btn-circle btn-danger text-white" ><i class="ti-trash"></i></button>
                                                </td>
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
                
    </div>
</template>

<script>
export default {
    name: "Home",

    data() {
        return {};
    },

    mounted() {},

    methods: {},
    beforeRouteEnter(to, from, next) {
    if (!window.Laravel.isLoggedin) {
      window.location.href = "/login";
    }
    next();
  },
};
</script>

<style></style>