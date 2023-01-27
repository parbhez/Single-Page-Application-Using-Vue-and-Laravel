<template>
  <div>
    
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Product</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="#">Layout</a></li>
              <li class="breadcrumb-item active">Collapsed Sidebar</li>
            </ol>
          </div>
        </div>
      </div>
      <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row mt-4">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <button
                  type="button"
                  class="btn btn-info float-right"
                  data-toggle="modal"
                  data-target="#addProduct"
                >
                  Add Product
                </button>
              </div>
      
              <div class="card-body">
                <div class="row">
                  <div class="col-md-2">
                    <div class="input-group">
                      <strong>Search By: </strong>
                    </div>
                  </div>

                  <div class="col-md-3">
                    
                    <div class="input-group">
                      <select v-model="queryField" class="form-control">
                        <option value="name">Name</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <input
                      type="text"
                      v-model="query"
                      class="form-control"
                      placeholder="Search"
                    />
                  </div>
                </div>

               
                <div class="clearfix mb-3"></div>

                <div class="table-responsive">
                  <table class="table table-striped">
                    <tr>
                      <th class="text-center pt-2">
                        <input type="checkbox" />
                      </th>
                      <th>SL</th>
                      <th>Product</th>
                      <th>Status</th>
                      <th>Action</th>
                    </tr>
                    <tr v-for="(product, key) in allProducts.data" :key="key">
                      <td class="text-center pt-2">
                        <input type="checkbox" />
                      </td>
                      <td>
                        {{ product.id }}
                      </td>
                      <td>
                        {{ product.name }}
                      </td>

                      <td>
                        <div class="badge badge-primary">
                          {{ product.status == 1 ? "Published" : "Draft" }}
                        </div>
                      </td>
                      <td>
                        <button
                          class="btn btn-primary btn-sm"
                          @click.prevent="editRow((selectedProduct = product))"
                        >
                          Edit</button
                        >&nbsp;
                        <button
                          class="btn btn-info btn-sm"
                          @click.prevent="editModal(product)"
                        >
                          Another Edit</button
                        >&nbsp;
                        <button
                          class="btn btn-danger btn-sm"
                          @click.prevent="deleteRow(product.id)"
                        >
                          Delete
                        </button>
                      </td>
                    </tr>

                    <tr v-if="!productLength">
                        <td class="text-danger" colspan="10">Data Not Found</td>
                    </tr>

                  </table>
                </div>

                <!-- <ThePagination :links="allProducts.links"></ThePagination> -->

                <Pagination
                  v-if="pagination.last_page > 1"
                  :pagination="pagination"
                  :offset="5"
                  @paginate="query === '' ? get_all_product() : searchData()"
                ></Pagination>


              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>

  <!-- /.Create Modal Start-->
  <CreateProduct
    :product="product"
    :category="category"
    :errors="errors"
    @addProduct="addProduct()"
  ></CreateProduct>
  <!-- /.Create Modal End-->

  <!-- /.Edit Modal Start-->
  <EditProduct
    :selectedProduct="selectedProduct"
    :errors="errors"
    @updateProduct="updateProduct"
  ></EditProduct>
  <!-- /.Edit Modal End-->

  <!-- /.Another Edit Modal Start-->
  <AnotherEditProduct
    :errors="errors"
    :anothercategory="anothercategory"
    @anotherUpdateProduct="anotherUpdateProduct"
  ></AnotherEditProduct>
  <!-- /.Another Edit Modal End-->
</template>

<script>
import axios from "axios";
import CreateProduct from "./CreateProduct.vue";
import EditProduct from "./EditProduct.vue";
import AnotherEditProduct from "./AnotherEditProduct.vue";
import ThePagination from "../common/ThePagination.vue";
import Pagination from "../common/Pagination.vue";

// axios.defaults.baseURL = 'http://localhost/vue-spa/laravel-app/api'

export default {
  components: {
    CreateProduct,
    EditProduct,
    AnotherEditProduct,
    Pagination,
    ThePagination,
  },

  data() {
    return {
      product: {
        title: "Add Category (Parent Child Relation using props nad $emit)",
      },
      allProducts: [],

      pagination: {
        current_page: 1,
      },

      query: "",
      queryField: "name",

      category: {
        category_name: "",
      },

      anothercategory: {
        name: "",
        id: "",
      },

      selectedProduct: {},

      errors: {},
    };
  },

  mounted() {
    this.get_all_product();
  },

  watch: {
    query(newQ, old) {
      if (newQ === "") {
        this.get_all_product();
      } else {
        this.searchData();
      }
    },
  },

  computed: {
    productLength() {
      return this.allProducts.total;
    },

    
  },

  methods: {

   
    async searchData() {
      await axios
        .get(
          "/search-product" +
            "/" +
            this.queryField +
            "/" +
            this.query +
            "?page=" +
            this.pagination.current_page
        )
        .then((response) => {
          this.allProducts = response.data;
          this.pagination = response.data;
          console.log(response.data);
        })
        .catch((e) => {
          console.log(e);
        });
        history.pushState(null, null, "?page=" + this.pagination.current_page + "&field=" + this.queryField + "&query=" + this.query);
    },

    async get_all_product() {
      await axios
        .get("/product?page=" + this.pagination.current_page)
        .then((response) => {
          //console.log(response.data);
          this.allProducts = response.data;
          this.pagination = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
      history.pushState(null, null, "?page=" + this.pagination.current_page);
    },

    addProduct() {
      axios
        .post("/store-product", this.category)
        .then((response) => {
          $("#addProduct").modal("hide");
          // return console.log(response.data);
          if (response.data.success === "success") {
            this.$toast.success(response.data.msg);
          } else {
            this.$toast.error(response.data.msg);
          }
          this.get_all_product();
          this.resetForm();
        })
        .catch((error) => {
          if (error.response.status === 422) {
            this.errors = error.response.data.errors;
          }
          console.log(error);
        });
    },

    resetForm() {
      this.category = {
        category_name: "",
      };
    },

    async deleteRow(id) {
      if (!window.confirm("Are You Sure ??")) {
        return;
      }
      await axios
        .get("/delete-product/" + id)
        .then((response) => {
          // console.warn(response.data)
          if (response.data.success === "success") {
            this.$toast.success(response.data.msg);
          } else {
            this.$toast.error(response.data.msg);
          }
          this.get_all_product();
        })
        .catch((error) => {
          // console.log(error.response.statusText)
          this.$toast.error(error.response.statusText);
        });
    },

    async editRow(selectedProduct) {
      $("#editProduct").modal("show");
      //console.log(selectedProduct)
    },

    async updateProduct(selected_Product) {
      await axios
        .post("/update-product", selected_Product)
        .then((response) => {
          $("#editProduct").modal("hide");
          if (response.data.success === "success") {
            this.$toast.success(response.data.msg);
            this.selectedProduct = {};
          } else {
            this.$toast.error(response.data.msg);
          }
          //console.log(response.data);
        })
        .catch((error) => {
          if (error.response.status === 422) {
            this.errors = error.response.data.errors;
          }
          //console.log(error);
        });
    },

    async editModal(product) {
      $("#anotherEditProduct").modal("show");
      this.anothercategory.id = product.id;
      this.anothercategory.name = product.name;
    },

    async anotherUpdateProduct(category) {
      await axios
        .post("/another-update-product", category)
        .then((response) => {
          $("#anotherEditProduct").modal("hide");
          if (response.data.success === "success") {
            this.$toast.success(response.data.msg);
          } else {
            this.$toast.error(response.data.msg);
          }
          this.anothercategory = {};
          this.get_all_product();
          console.log(response.data);
        })
        .catch((error) => {
          if (error.response.status === 422) {
            this.errors = error.response.data.errors;
          }
          console.log(error);
        });
    },


  },
};
</script>
