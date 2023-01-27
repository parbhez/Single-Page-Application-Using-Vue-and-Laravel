
<template>
 
 <div class="wrapper">
      
      <TheNavbar/>
      <TheSidevar/>
     

      <!-- Main Content -->
      <div class="content-wrapper">
        <div id="loading" v-if="loading">
          <img src="/static/img/loading.gif" alt="Loading">
        </div>
        <router-view></router-view>
      </div>
      
      <TheFooter />

    </div>

</template>


<script>
  import TheSidevar from './views/TheSidebar.vue'
  import TheNavbar from './views/TheNavbar.vue'
  import TheFooter from './views/TheFooter.vue'
  
  export default {
    components:{
      TheSidevar,
      TheNavbar,
      TheFooter
    },
    data(){
      return {
        loading: false
      }
    },

    created(){
      // window.$eventBus.on('loading-status', (payload) => {
      // this.loading = payload;
      // })
      this.$eventBus.on('loading-status', (payload) => {
          this.loading = payload;
      })
    }

  }
</script>

<style scoped>

/* #loading {
    width: 100%;
    height: 100vh;
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 999999999999;
    text-align: center;
    background: rgba(62, 60, 60, 0.7);
    display: flex;
    justify-content: center;
    align-items: center;
} */

#loading{
	position: fixed;
	z-index: 999999999;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background: rgba(255,255,255, 0.8);
	text-align: center;
	color: #fff;
	font-size: 55px;
	padding-top: calc(50vh - 158px);
}
</style>
