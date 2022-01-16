<template>

    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" v-if="isLoggedIn">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="assets/images/logo-icon.png" alt="homepage" class="dark-logo">
                            <!-- Light Logo icon -->
                            <img src="assets/images/logo-light-icon.png" alt="homepage" class="light-logo">
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         <!-- dark Logo text -->
                         <img src="assets/images/logo-text.png" alt="homepage" class="dark-logo">
                         <!-- Light Logo text -->
                         <img src="assets/images/logo-light-text.png" class="light-logo" alt="homepage"></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav me-auto">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler d-block d-md-none waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                        <li class="nav-item"> <a class="nav-link sidebartoggler d-none d-lg-block d-md-block waves-effect waves-dark" href="javascript:void(0)"><i class="icon-menu"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->

                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">

                        <li class="nav-item"> <a class="nav-link  waves-effect waves-light" @click="logout()" href="javascript:void(0)"><i class=" icon-login"></i></a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" v-if="isLoggedIn">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar ps ps--theme_default ps--active-y" data-ps-id="2c10afb3-0ae7-58b5-4272-d170eff1cd59">
                <!-- User Profile-->
                <div class="user-profile">
                    <div class="user-pro-body">
                        <div>
                            <img src="assets/images/users/2.jpg" alt="user-img" class="img-circle">
                        </div>
                        <div class="dropdown">
                            <a href="javascript:void(0)" class="dropdown-toggle u-dropdown link hide-menu" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Steave Gection
                                <span class="caret"></span>
                            </a>
                            <div class="dropdown-menu animated flipInY">
                                <!-- text-->
                                <a href="javascript:void(0)" class="dropdown-item">
                                    <i class="ti-user"></i> My Profile</a>
                                <!-- text-->
                                <a href="javascript:void(0)" class="dropdown-item">
                                    <i class="ti-wallet"></i> My Balance</a>
                                <!-- text-->
                                <a href="javascript:void(0)" class="dropdown-item">
                                    <i class="ti-email"></i> Inbox</a>
                                <!-- text-->
                                <div class="dropdown-divider"></div>
                                <!-- text-->
                                <a href="javascript:void(0)" class="dropdown-item">
                                    <i class="ti-settings"></i> Account Setting</a>
                                <!-- text-->
                                <div class="dropdown-divider"></div>
                                <!-- text-->
                                <a href="pages-login.html" class="dropdown-item">
                                    <i class="fa fa-power-off"></i> Logout</a>
                                <!-- text-->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav active">
                    <ul id="sidebarnav" class="in">
                        <li>

                            <router-link to="/store" class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                                <i class="icon-speedometer"></i>
                                <span class="hide-menu">Store
                                </span>
                            </router-link>
                        </li>
                        <li >
                            <router-link to="/pos" class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                                <i class="icon-handbag"></i>
                                <span class="hide-menu">ຂາຍສິນຄ້າ POS 
                                </span>
                            </router-link>
                        </li>
                        
                        <li >
                            <router-link to="/transection" class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                                <i class=" icon-graph"></i>
                                <span class="hide-menu">Transection
                                </span>
                            </router-link>
                        </li>
                        <li >
                            <router-link to="/report" class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                                <i class="icon-chart"></i>
                                <span class="hide-menu">ລາຍງານ Report
                                </span>
                            </router-link>
                        </li>

                        <!-- <li >
                            <router-link to="/user" class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                                <i class="icon-user"></i>
                                <span class="hide-menu">ຈັດການຜູ້ໃຊ້
                                </span>
                            </router-link>
                        </li> -->

                    </ul>
                </nav>
            <div class="ps__scrollbar-x-rail" style="left: 0px; bottom: 0px;"><div class="ps__scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__scrollbar-y-rail" style="top: 0px; height: 864px; right: 0px;"><div class="ps__scrollbar-y" tabindex="0" style="top: 0px; height: 562px;"></div></div></div>

        </aside>



                  <router-view/>



        <footer class="footer" v-if="isLoggedIn">
            © 2021 Sorndev
        </footer>

    </div>
</template>

<script>
export default {
    name: 'Myapp01App',

    data() {
        return {
            isLoggedIn: false,
        };
    },

    mounted() {

    },

    methods: {

         logout() {
            this.$axios.get('/sanctum/csrf-cookie').then(response => {
                this.$axios.post('/api/logout')
                    .then(response => {
                        if (response.data.success) {
                            window.location.href = "/"
                        } else {
                            console.log(response)
                        }
                    })
                    .catch(function (error) {
                        console.error(error);
                    });
            })
        }

    },
    created(){
        if (window.Laravel.isLoggedin) {
            this.isLoggedIn = true
        }
    }
};
</script>

<style >
    .cursor-pointer{
  cursor: pointer;
}
</style>