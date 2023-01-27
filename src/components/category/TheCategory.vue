<template>
  <div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Category</h1>
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
              <!-- /.Modal Start-->
              <CreateCategory></CreateCategory>
              <!-- /.Modal End-->

              Total = {{ totalCount }}

              <div class="card-body">
                <div class="float-left">
                  <select class="form-control selectric">
                    <option>Action For Selected</option>
                    <option>Move to Draft</option>
                    <option>Move to Pending</option>
                    <option>Delete Pemanently</option>
                  </select>
                </div>

                <div class="float-right">
                  <form>
                    <div class="input-group">
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Search"
                      />
                      <div class="input-group-append">
                        <button class="btn btn-primary">
                          <i class="fas fa-search"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                </div>

                <div class="clearfix mb-3"></div>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <tr>
                      <th class="text-center pt-2">
                        <input type="checkbox" />
                      </th>
                      <th>SL</th>
                      <th>Category</th>
                      <th>Status</th>
                      <th>Action</th>
                    </tr>
                    <tr
                      v-for="(category, key) in getAllCategories.data"
                      :key="key"
                    >
                      <td class="text-center pt-2">
                        <input type="checkbox" />
                      </td>

                      <td>{{ category.id }}</td>
                      <td>{{ category.name }}</td>

                      <td>
                        <div class="badge badge-success">
                          {{ category.status == 1 ? "Active" : "Inactive" }}
                        </div>
                      </td>
                      <td>
                        <button class="btn btn-primary btn-sm" @click.prevent="editModal(category)">Edit</button
                        >&nbsp;
                        <button class="btn btn-danger btn-sm" @click.prevent="deleteCategory(category)">Delete</button>&nbsp;
                        <button
                          class="btn btn-danger btn-sm"
                          data-toggle="modal"
                          data-target="#exampleDeleteModal"
                          @click.prevent="selectedCategory = category"
                        >
                          Another Delete
                        </button>
                      </td>
                    </tr>

                    <tr v-if="!totalCount">
                      <td class="text-danger text-center" colspan="10">
                        Data not found
                      </td>
                    </tr>
                  </table>
                </div>
                <div class="float-right">
                  <nav>
                    <ul class="pagination">
                      <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          <span class="sr-only">Previous</span>
                        </a>
                      </li>
                      <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">2</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">3</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                          <span class="sr-only">Next</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>

  <!-- Modal -->
  <div
    class="modal fade"
    id="exampleDeleteModal"
  >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Are You Sure ??</h5>
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

           <p>Do you really want to delete <strong>{{selectedCategory.name}}</strong> ?? </p>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-dismiss="modal"
            >
              No
            </button>
            <button class="btn btn-primary" @click.prevent="RemoveCategory">Yes</button>
          </div>
        </div>
    </div>
  </div>
<!--------Edit Modal start-->
<EditCategory 
:category="getCategoryForm"
:errors="errors"
></EditCategory>
<!--------Edit Modal End-->

</template>

<script>
import CreateCategory from "./CreateCategory.vue";
import EditCategory from "./EditCategory.vue";
import mixin from "../../mixin";
export default {
  mixins: [mixin],
  components: {
    CreateCategory,
    EditCategory,
  },

  data() {
    return {
      selectedCategory: {},
    };
  },

  mounted() {
    this.initCat();
  },

  computed: {
    getAllCategories() {
      return this.$store.getters["category/getCategories"];
    },
    totalCount() {
      return this.$store.getters["category/totalCount"];
    },
    getMessage() {
      return this.$store.getters["category/sendMessage"];
    },

    getCategoryForm(){
      return this.$store.state.category.categoryForm;
    },

    errors(){
      return this.$store.state.category.error;
    }
  },

  watch: {
    getMessage(message) {
      if (message !== null) {
        if (message.success === "success") {
          this.successMessage(message);
        } else {
          if (message.error === "error") {
            this.errorMessage(message);
          } else {
            this.serverError(message);
          }
        }
      } else {
        this.serverError(message);
      }
    },
  },

  methods: {
    initCat() {
      this.$store.dispatch("category/get_category");
    },

    deleteCategory(category) {
      this.$store.dispatch("category/deleteCategory", category);
    },
    RemoveCategory(){
      this.$store.dispatch("category/removeCategory", this.selectedCategory);
      $("#exampleDeleteModal").modal('hide');
    },
    editModal(category){
      this.$store.dispatch("category/editCategory", category);
    }
  },
};
</script>
