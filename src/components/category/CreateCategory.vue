<template>
  <div class="card-header">
    <button
      type="button"
      class="btn btn-info float-right"
      data-toggle="modal"
      data-target="#exampleModal"
    >
      Create Category
    </button>
  </div>
  <div
    class="modal fade"
    id="exampleModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog" role="document">
     <form @submit.prevent="save_category"> 
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
              <div class="form-group">
                  <div>
                    <ul>
                      <li class="text-danger" v-for="error,key in validation_error" :key="key">{{ error[0] }}</li>
                    </ul>
                  </div>
                 <div>
                  <ul>
                    <li v-if="db_error" class="text-danger">{{ db_error }}</li>
                  </ul>
                 </div>
              </div>
              <div v-for="(category, key) in categories" :key="key">
                name: {{ category.name }} , Key: {{ key }} , length: {{ categories.length-1 }} 
                <div class="row">
                  <div class="col-md-10">
                    <label for="name" class="form-label">Name</label><br />
                    <input
                      type="text"
                      class="form-control"
                      id="name"
                      placeholder="Category Name"
                      v-model="category.category_name"
                    />
                  </div>
                  <div class="col-md-2" style="padding-top: 2.15rem !important">
                    <button
                      class="btn btn-success btn-sm"
                      @click.prevent="addRow(key)"
                      v-show="key === categories.length - 1"
                    >
                      +
                    </button>
                    &nbsp;
                    <button
                      class="btn btn-danger btn-sm"
                      @click.prevent="removeRow(key)"
                      v-show="key || (!key && categories.length > 1)"
                    >
                      -
                    </button>
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
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import mixin from '../../mixin'
import { Button, HasError, AlertError } from 'vform/src/components/bootstrap5'
export default {
  mixins: [mixin],
  components: {
    Button, HasError, AlertError
  },

  data() {
    return {
        categories: [
        {
          category_name: "",
        },
      ],
      validation_error: null,
      db_error: null,
    };
  },
  methods: {
    addRow(key) {
      this.categories.push({
        category_name: "",
      });
    },
    removeRow(key) {
      this.categories.splice(key, 1);
    },

    async save_category(){

      if(!this.categories[0].category_name){
        this.$iziToast.error({
                title: 'Opps..',
                position: 'topRight',
                message: "Category Field Can not be null",
            });
          return;
      }

      this.$eventBus.emit('loading-status', true);
      await axios.post("/save-category", { categories: this.categories })
      .then( (response)=>{
        if(response.data.code !== 422 && response.data.code !== 500){
          this.$eventBus.emit('loading-status', false);
          $('#exampleModal').modal('hide');
          this.successMessage(response.data);
          this.$store.dispatch("category/get_category");
          this.formReset();
          console.log(response.data)

        }else{
          if(response.data.code === 422){
            this.$eventBus.emit('loading-status', false);
            this.db_error = null;
            this.validation_error = response.data.result;
            this.validationError(response.data);
            console.log(response.data);
          }else{
            this.$eventBus.emit('loading-status', false);
            this.validation_error = null;
            this.errorMessage(response.data);
            this.db_error = response.data.result;
          }
           
        }
      } )
      .catch((error)=>{
        this.$eventBus.emit('loading-status', false);
        console.log(error)
       
      })
    },

    formReset(){
      this.categories = [
              {
                category_name: ''
              }
            ],
      this.validation_error = null,
      this.db_error = null
    }

  },
};
</script>
