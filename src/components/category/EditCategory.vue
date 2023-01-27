<template>
    <div class="card-header">
      <button
        data-toggle="modal"
        data-target="#exampleEditModal"
      >
      </button>
    </div>
    <div
      class="modal fade"
      id="exampleEditModal"
    >
      <div class="modal-dialog" role="document">
       <form @submit.prevent="update_category"> 
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Edit Category</h5>
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
                
                <!-- {{ errors }} -->
              <div class="col-md-12">
                <div class="form-group">
                    <div>
                      <ul>
                        <li class="text-danger" v-for="error,key in errors.validation_error" :key="key">{{ error[0] }}</li>
                      </ul>
                    </div>
                   <div>
                    <ul>
                      <li v-if="errors.db_error" class="text-danger">{{ errors.db_error }}</li>
                    </ul>
                   </div>
                </div>
                <div>
                  <div class="row">
                    <div class="col-md-10">
                      <label for="category_name" class="form-label">Name</label>
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Category Name"
                        v-model="category.category_name"
                      />
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
              <button type="submit" class="btn btn-primary">update</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  import mixin from '../../mixin'
  export default {
    mixins: [mixin],
    props:{
        category:{
            type:Object,
            default: ()=>{}
        },
        errors:{
            type:Object,
            default: ()=>{}
        }
    },
  
    data() {
      return {
        
      }
    },
    methods: {
      async update_category(){
        this.$store.dispatch("category/updateCategory", {vm:this});
    },
  }
}
  </script>
  