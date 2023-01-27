<template>
    <div
      class="modal fade"
      id="editProduct"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <form>
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                Edit Modal
              </h5>
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
               <!-- {{ errors.category_name }}  -->
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-12">
                    <label for="name" class="form-label">Product Name</label>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Product Name"
                      v-model="selectedProduct.name"
                    />
                    <div v-if="errors.name">
                      <span class="text-danger">{{ errors.name[0] }}</span>
                    </div>
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
              <button
                type="submit"
                class="btn btn-primary"
                @click.prevent="EditProduct(selectedProduct)"
              >
                Update Product
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    emits:{
        updateProduct:{
            type: Object,
            default: ()=> {}
        }
    },
    props: {
        selectedProduct: {
        type: Object,
        default: () => {},
      },
      errors:{
        type:Object,
        default: ()=> {}
      }
    },
   
    methods: {
        EditProduct(selected_Product) {
        this.$emit('updateProduct', selected_Product)
      
      },
    },
  };
  </script>
  