<template>
  <div class="float-right">
    <nav>
      <ul class="pagination">

        <li class="page-item" 
            :class="[
                link.url === null ? 'disabled' : '',
                link.active ? 'active' : ''
            ]"
            v-for="(link,index) in links" :key="index"
        >
          <a class="page-link" :href="link.url === null ? '#' : link.url" v-html="link.label"></a>
        </li>

      </ul>
    </nav>
  </div>
</template>

<script>
    export default {
        props:{
            links:{
                type: Object,
                default: ()=> {},
            }
        }
    }
</script>