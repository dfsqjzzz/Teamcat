webpackJsonp([3],{JIU6:function(t,a){},"Yp+a":function(t,a,e){"use strict";Object.defineProperty(a,"__esModule",{value:!0});var s=e("Dd8w"),o=e.n(s),i=(e("IcnI"),e("NYxO")),l={name:"CIHead",props:["flowID"],data:function(){return{themeLight:"light",myTaskFlows:[],currentTaskFlow:null,taskFlowName:"",hasTasks:!1}},computed:{currentTaskFlowName:function(){return this.loadSelectTaskFlow(this.flowID),this.taskFlowName},showNewButton:function(){return"ciTaskFlowItem"===this.$route.name}},methods:o()({},Object(i.d)("citaskflow",["setAddedSectionDialogShow"]),{loadMyTaskFlows:function(){var t=this;this.$axios.get("/api/ci/task_flow/my?page_size=10000").then(function(a){t.myTaskFlows=a.data.result.results},function(t){})},loadSelectTaskFlow:function(t){var a=this;this.$axios.get("/api/ci/task_flow/"+t+"/").then(function(t){a.currentTaskFlow=t.data.result,a.taskFlowName=a.currentTaskFlow.FlowName;for(var e=0;e<a.currentTaskFlow.Sections.length;e++)a.currentTaskFlow.Sections[e].CITaskIDs.length>0?a.hasTasks=!0:a.hasTasks=!1},function(t){})},onAddSection:function(){this.setAddedSectionDialogShow(!0)}}),created:function(){this.loadMyTaskFlows(),this.loadSelectTaskFlow(this.flowID)},components:{}},n={render:function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",{staticClass:"app-body-head-default"},[e("div",{staticClass:"app-body-header-bar-default"},[e("Row",[e("Col",{attrs:{lg:16,md:14,sm:16,xs:16}},[e("div",{staticClass:"app-body-header-leftbar-default"},[e("ul",{staticClass:"app-body-head-menu"},[e("li",{staticClass:"app-body-head-menu-item",staticStyle:{width:"50px"}},[e("Dropdown",{attrs:{trigger:"click"}},[e("a",{attrs:{href:"javascript:void(0)"}},[e("Icon",{attrs:{type:"md-reorder",size:24}})],1),t._v(" "),e("DropdownMenu",{staticStyle:{"max-height":"400px","overflow-y":"scroll"},attrs:{slot:"list"},slot:"list"},[e("DropdownItem",{key:"default_return"},[e("router-link",{attrs:{to:"/ci/taskflow",tag:"li"}},[e("a",{staticStyle:{"text-align":"left",height:"30px",display:"block","padding-top":"5px"},attrs:{href:"#"}},[e("Icon",{attrs:{type:"ios-exit"}}),t._v(" 返回任务流")],1)])],1),t._v(" "),t._l(t.myTaskFlows,function(a){return e("DropdownItem",{key:a.id},[e("router-link",{attrs:{to:"/ci/taskflow/"+a.id,tag:"li"}},[e("a",{staticStyle:{"text-align":"left",height:"30px",display:"block","padding-top":"5px"},attrs:{href:"#"}},[e("Icon",{attrs:{type:"ios-folder"}}),t._v(" "+t._s(a.FlowName))],1)])],1)})],2)],1)],1),t._v(" "),e("router-link",{staticClass:"app-body-head-menu-item",staticStyle:{width:"auto","padding-left":"10px","padding-right":"10px"},attrs:{to:"/ci/taskflow/"+t.flowID,tag:"li",exact:"","active-class":"app-body-head-menu-item-active"}},[e("a",[t._v(t._s(t.currentTaskFlowName))])]),t._v(" "),e("router-link",{staticClass:"app-body-head-menu-item",staticStyle:{"margin-left":"10px"},attrs:{to:"/ci/taskflow/"+t.flowID+"/history",tag:"li","active-class":"app-body-head-menu-item-active"}},[e("a",{attrs:{href:"/ci/taskflow/12/history"}},[e("i",{staticClass:"fa fa-fw  fa-bus"}),t._v("执行记录")])])],1)])]),t._v(" "),e("Col",{attrs:{lg:4,md:4,sm:0,xs:0}},[e("div",{staticStyle:{"padding-top":"20px",height:"inherit"}})]),t._v(" "),e("Col",{attrs:{lg:4,md:6,sm:8,xs:8}},[e("div",{staticClass:"app-body-header-rightbar-default",staticStyle:{"padding-top":"15px",height:"inherit"}},[t.showNewButton?e("span",{on:{click:t.onAddSection}},[e("Tooltip",{attrs:{content:"添加工作流阶段"}},[e("Avatar",{staticClass:"cursor-hand",staticStyle:{"background-color":"#32be77"},attrs:{icon:"md-add"}})],1)],1):t._e()])])],1)],1)])},staticRenderFns:[]};var r=e("VU/8")(l,n,!1,function(t){e("JIU6")},"data-v-5bfffaea",null);a.default=r.exports}});
//# sourceMappingURL=3.e23437c9d93eb350718f.js.map