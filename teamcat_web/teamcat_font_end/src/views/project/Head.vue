<template>
  <div class="app-body-head-default">
  <div class="app-body-header-bar-default">
          <div class="app-body-header-leftbar-default pull-left">
                  <ul class="app-body-head-menu">

                    <router-link :to="'/project/'+projectID+'/plan'" tag="li" active-class="app-body-head-menu-item-active" class="app-body-head-menu-item">
                      <a :href="'h/project/'+projectID+'/plan'"><i class="fa fa-fw  fa-bus"></i>计划</a>
                    </router-link>
                    <li class="app-body-head-menu-item">
                      <a  :href="'/project/'+ projectID +'/issue/all'"><i class="fa fa-flag fa-fw fa-lg"></i> <span>问题</span></a>
                    </li>
                    <router-link :to="'/project/'+projectID+'/fortesting'" tag="li" active-class="app-body-head-menu-item-active" class="app-body-head-menu-item">
                      <a :href="'h/project/'+projectID+'/fortesting'"><i class="fa fa-fw  fa-bus"></i>提测</a>
                    </router-link>
                    <router-link :to="'/project/'+projectID+'/task'" tag="li" active-class="app-body-head-menu-item-active" class="app-body-head-menu-item">
                      <a :href="'h/project/'+projectID+'/task'"><i class="fa fa-fw  fa-bus"></i>任务</a>
                    </router-link>
                    <li class="app-body-head-menu-item">
                      <a  :href="'/project/'+ projectID +'/statistics/all'"><i class="fa fa-flag fa-fw fa-lg"></i> <span>统计</span></a>
                    </li>
                    <li class="app-body-head-menu-item">
                      <a  :href="'/project/'+ projectID +'/archive/all'"><i class="fa fa-flag fa-fw fa-lg"></i> <span>归档</span></a>
                    </li>
                    <li class="app-body-head-menu-item">
                      <a  :href="'/project/'+ projectID +'/settings/basic'"><i class="fa fa-flag fa-fw fa-lg"></i> <span>设置</span></a>
                    </li>
                   </ul>

          </div>

          <div v-if="showVersionDropDown" class="pull-left" style="margin-left: 200px;padding-top: 20px;">
             <div>

               <Select v-model="lastestVersion"  @on-change="onVersionChange" :transfer="true" size="small" style="width:200px"  :filterable="true">
                 <Option v-for="item in versionList" :value="item.id" :key="item.id" :label="item.VersionLabel">
                    {{ item.VersionLabel }} </Option>
               </Select>
             </div>

          </div>
    <div class="app-body-header-rightbar-default pull-right">
            <span @click="newTask" v-if="showNewButton">
              <Avatar style="background-color: #32be77;"  class="cursor-hand" icon="md-add" />
            </span>
    </div>
  </div>
  </div>
</template>

<script>
  import Select from '../../../node_modules/iview/src/components/select/select.vue'
  import Option from '../../../node_modules/iview/src/components/select/option.vue'
  import { mapMutations } from 'vuex'

  export default {
    components: {
      Option,
      Select
    },
    name: 'ProjectHead',
    props: ['projectID'],
    data() {
    return {
      versionList: [],
      lastestVersion: 0
    }
  },

  computed: {
      showVersionDropDown: function () {
        if (this.$route.name === 'projectTask' || this.$route.name === 'projectFortesting' || this.$route.name === 'projectPlan') {
          return true
        }
        else {
          return false
        }
      },
    showNewButton: function () {
      if (this.$route.name === 'projectTask' || this.$route.name === 'projectFortesting' || this.$route.name === 'projectPlan') {
        return true
      }
      else {
        return false
      }
    }
  },
  methods: {
    ...mapMutations('projectglobal',['setCreateDialogShow','setProjectVersion']),
    newTask () {
      this.setCreateDialogShow(true)
    },
    onVersionChange (value) {
      console.log(value)
      this.setProjectVersion(value)
    },

    loadProjectVersions: function () {
      this.$axios.get('/api/project/' + this.projectID + '/detail?extinfo=1').then(response => {
        console.log(response)
        let versions = response.data.result.Versions
        this.versionList = []
        if( versions.length > 0)
        {

          this.versionList.push(...versions)
          this.lastestVersion = versions[0].id
          this.setProjectVersion(this.lastestVersion)
        }
      }, response => {

      })
    }
  },
  created: function () {
    this.loadProjectVersions()
  },

  watch: {
      projectID: function () {
        this.loadProjectVersions()
      }
  }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">
@import '../../components/layout/appBody';
@import '../../components/layout/appHead';
@import '../../assets/teamcat/global/less/global';

</style>
