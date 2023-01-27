<template>
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
    <div
      class="modal fade"
      id="addProduct"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <form @submit.prevent="save_product">
           
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="col-md-12">
                <div class="row">
                    <AlertError :form="form" />
                    <div class="col-md-12">
                      <label for="name" class="form-label">Product Name</label>

                      {{ form.product_name }}
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Product Name"
                        v-model="form.product_name"
                      />
                      <!-- <div v-if="form.errors.has('product_name')" v-html="form.errors.get('product_name')" class="text-danger" /> -->
                      <HasError :form="form" field="product_name" />
                    </div>
                    
                  </div>
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                Close
              </button>
              <button type="submit" class="btn btn-primary" :disabled="form.busy">Add Product</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  import Form from 'vform';
  import { Button, HasError, AlertError } from 'vform/src/components/bootstrap5'
  export default {
    components: {
    Button, HasError, AlertError
  },
    data(){
        return {
            form: new Form({
                product_name: ''
            })
        }
    },
    methods:{
        async save_product () {
        await this.form.post('http://localhost/vue-spa/laravel-app/api/save-product')
        .then( (response)=>{
        console.log(response.data)
      } )
      .catch((error)=>{
        console.log(error)
      })
    }
    }
  }
  </script>
  