webpackJsonp([5,8],{"9Yyx":function(t,e){},"9kBX":function(t,e){},F3h5:function(t,e,a){"use strict";var s={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[t.item.Display?a("Card",{staticClass:"citask-card",attrs:{bordered:!1}},[a("div",{staticClass:"citask-card-title"},[a("a",{staticStyle:{color:"inherit","text-decoration":"underline"},attrs:{href:t.item.TaskHistoryURI}},[t._v("\n      "+t._s(t.item.TaskName)+"\n    ")]),t._v(" "),a("span",{staticClass:"pull-right",staticStyle:{"padding-right":"10px"}},[a("a",{attrs:{href:t.item.TaskConfigURI}},[a("Icon",{staticStyle:{"margin-left":"10px"},attrs:{type:"ios-settings",size:18,color:"#555"}})],1)])]),t._v(" "),a("div",{staticClass:"citask-card-body"},[a("span",{staticStyle:{width:"220px",display:"inline-block","text-align":"left"}},[a("span",{staticStyle:{"margin-top":"25px","margin-left":"0px"}},[1===t.item.LastRunStatus?a("Icon",{staticStyle:{color:"#388e83"},attrs:{type:"ios-checkmark-circle"}}):t._e(),t._v(" "),2===t.item.LastRunStatus?a("Icon",{staticStyle:{color:"darkred"},attrs:{type:"ios-close-circle"}}):t._e(),t._v(" "),3===t.item.LastRunStatus?a("Icon",{staticStyle:{color:"olive"},attrs:{type:"ios-remove-circle"}}):t._e(),t._v("\n          "+t._s(t.item.LastRunTime)+" ")],1)]),t._v(" "),a("span",{staticStyle:{width:"80px","margin-top":"25px",display:"inline-block"}},[t.item.ParameterGroups.length>0?a("Dropdown",{attrs:{trigger:"click"},on:{"on-click":t.onDPItemClick}},[a("Button",{staticStyle:{padding:"3px 15px"},attrs:{type:"default",shape:"circle"}},[t._v("\n          构建\n          "),a("Icon",{attrs:{type:"md-arrow-dropdown"}})],1),t._v(" "),a("DropdownMenu",{staticStyle:{"max-height":"500px","overflow-y":"scroll",top:"0px"},attrs:{slot:"list"},slot:"list"},t._l(t.item.ParameterGroups,function(e){return a("DropdownItem",{key:e.id,attrs:{name:e.id+","+t.item.id}},[e.default?a("Icon",{attrs:{type:"checkmark-round"}}):t._e(),t._v(" "+t._s(e.title))],1)}))],1):t._e(),t._v(" "),0===t.item.ParameterGroups.length?a("Button",{staticStyle:{padding:"3px 15px"},attrs:{type:"default",shape:"circle"},on:{click:function(e){t.onBuildClick(t.item.id)}}},[t._v("\n          构建\n      ")]):t._e()],1)])]):t._e()],1)},staticRenderFns:[]};var o=a("VU/8")({name:"ciTaskItem",props:["item"],data:function(){return{msg:""}},methods:{onDPItemClick:function(t){var e=this,a=t.split(",");this.$axios.get("/api/ci/task_basic/"+a[1]+"/start/?BuildParameter="+a[0]).then(function(t){e.$Message.success({content:t.data.result.message,duration:10})},function(t){e.$Message.error({content:t.data.result.message,duration:10})})},onBuildClick:function(t){var e=this;this.$axios.get("/api/ci/task_basic/"+t+"/start/").then(function(t){e.$Message.success({content:t.data.result.message,duration:10})},function(t){e.$Message.error({content:t.data.result.message,duration:10})})}}},s,!1,function(t){a("a4JU")},"data-v-51a23638",null);e.a=o.exports},I72q:function(t,e){},UxPt:function(t,e){},XGNi:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a("Dd8w"),o=a.n(s),i=(a("IcnI"),a("NYxO")),n=a("HA7x"),c=a("mM4c"),l=a("F3h5"),r=a("P7xe"),d={name:"ciTaskFlowItem",props:["flowID"],data:function(){return{taskFlow:{},currentSection:0}},computed:o()({},Object(i.c)("citaskflow",["addedSection","ciTaskAddedToSection","sectionRenamed"]),Object(i.c)(["appBodyHeight"]),{taskContainerHeight:function(){return this.appBodyHeight},taskFlowID:function(){return this.flowID+""=="undefined"?0:this.flowID},sectionID:function(){return this.currentSection}}),methods:o()({},Object(i.d)("citaskflow",["setAddedSection","setAddedSectionDialogShow","setSectionRenamed","setRenameSectionDialogShow","setCITaskAddedToSectionDialogShow","setCITaskAddedToSection"]),{loadFlowTasks:function(t){var e=this;t+""!="0"&&this.$axios.get("/api/ci/task_flow/"+t+"/").then(function(t){e.taskFlow=t.data.result},function(t){})},editSection:function(t){this.currentSection=t,this.setCITaskAddedToSectionDialogShow(!0)},onReachBottom:function(t){},onEnd:function(t){console.log(t);var e=t.to.getAttribute("id"),a=t.from.getAttribute("id"),s=t.item.getAttribute("id"),o=t.oldIndex,i=this.findSection(e),n=this.findSection(a);i.CITaskIDs.push(s),n.CITaskIDs.splice(o,1),console.log(i),console.log(n),this.$axios.patch("/api/ci/task_flow/section/"+e,{CITasks:i.CITaskIDs.toString()}).then(function(t){console.log(t)},function(t){}),this.$axios.patch("/api/ci/task_flow/section/"+a,{CITasks:n.CITaskIDs.toString()}).then(function(t){console.log(t)},function(t){})},flowContextMenuClick:function(t){var e=this,a=t.split(":"),s=a[0],o=a[1];if(this.currentSection=o,"rename"===s&&this.setRenameSectionDialogShow(!0),"start"===s&&this.startSection(o),"delete"===s){var i=this.findSection(o).SectionName;this.$Modal.confirm({title:"删除确认",content:"<p>删除是危险操作，确认要删除任务阶段 ["+i+" ] 吗？</p>",onOk:function(){e.deleteFlowSection(o)},onCancel:function(){}})}},deleteFlowSection:function(t){var e=this;this.$axios.delete("/api/ci/task_flow/section/"+t).then(function(t){e.loadFlowTasks(e.taskFlowID)},function(t){})},startSection:function(t){var e=this;this.$axios.get("/api/ci/flow_section/"+t+"/start/").then(function(t){e.$Message.success({content:t.data.result.message,duration:10})},function(t){})},findSection:function(t){for(var e=null,a=0;a<this.taskFlow.Sections.length;a++)if(this.taskFlow.Sections[a].id+""===t){e=this.taskFlow.Sections[a];break}return e}}),created:function(){this.loadFlowTasks(this.taskFlowID)},watch:{addedSection:function(t){t&&(this.loadFlowTasks(this.taskFlowID),this.setAddedSection(!1))},sectionRenamed:function(t){t&&(this.loadFlowTasks(this.taskFlowID),this.setSectionRenamed(!1))},ciTaskAddedToSection:function(t){t&&(this.loadFlowTasks(this.taskFlowID),this.setCITaskAddedToSection(!1))},taskFlowID:function(){this.loadFlowTasks(this.taskFlowID)}},components:{SectionCreateDialog:n.a,ciTaskItem:l.a,FlowSection:r.a,TaskAddToSectionDialog:c.a}},u={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{style:"height:"+t.taskContainerHeight+"px; overflow-y:scroll;padding-left:10px;padding-right:10px;"},[t._l(t.taskFlow.Sections,function(e){return a("flow-section",{key:e.id,staticStyle:{"margin-left":"10px"},attrs:{columnID:e.id,group:t.taskFlowID,itemList:e.Tasks,columnTitle:e.SectionName,dishover:!1,shadow:!1,bordered:!0},on:{"update:itemList":function(a){t.$set(e,"Tasks",a)},end:t.onEnd,reachBottom:t.onReachBottom},scopedSlots:t._u([{key:"default",fn:function(t){return[a("ci-task-item",{attrs:{item:t.element}})]}}])},[a("Card",{staticClass:"board-column-title",attrs:{slot:"column-header",bordered:!1,shadow:!1,"dis-hover":!0},slot:"column-header"},[a("span",[a("Avatar",{staticStyle:{border:"1px solid black","background-color":"#f5f7f9",color:"#5f5f5f","margin-right":"10px"},attrs:{size:"small"}},[t._v(t._s(e.SectionIndex))]),t._v(" "),a("span",{staticStyle:{"font-size":"16px"}},[t._v(t._s(e.SectionName))])],1),t._v(" "),a("span",{staticClass:"pull-left cursor-hand",on:{click:function(a){t.editSection(e.id)}}},[e.Tasks.length<1?a("Icon",{attrs:{type:"md-add",size:16,color:"#388e83"}}):t._e(),t._v(" "),e.Tasks.length>0?a("Icon",{attrs:{type:"ios-create-outline",size:16,color:"#388e83"}}):t._e()],1),t._v(" "),a("span",{staticClass:"pull-right cursor-hand",staticStyle:{color:"#5f5f5f","margin-right":"-6px"}},[a("Dropdown",{on:{"on-click":t.flowContextMenuClick}},[a("i",{staticClass:"fa fa-bars fa-fw"}),t._v(" "),a("DropdownMenu",{attrs:{slot:"list"},slot:"list"},[a("DropdownItem",{staticStyle:{height:"20px","padding-top":"2px","text-align":"left"},attrs:{name:"start:"+e.id}},[a("span",{staticStyle:{"margin-right":"5px"}},[a("Icon",{attrs:{type:"md-play"}})],1),t._v(" "),a("span",[t._v("执行")])]),t._v(" "),a("DropdownItem",{staticStyle:{height:"20px","padding-top":"2px","text-align":"left"},attrs:{name:"rename:"+e.id}},[a("span",{staticStyle:{"margin-right":"5px"}},[a("Icon",{attrs:{type:"md-create"}})],1),t._v(" "),a("span",[t._v("重命名")])]),t._v(" "),a("DropdownItem",{staticStyle:{height:"20px","padding-top":"2px","text-align":"left"},attrs:{name:"delete:"+e.id}},[a("span",{staticStyle:{"margin-right":"5px"}},[a("Icon",{attrs:{type:"ios-trash"}})],1),t._v(" "),a("span",[t._v("删除")])])],1)],1)],1)])],1)}),t._v(" "),a("section-create-dialog",{attrs:{flowID:t.taskFlowID,sectionID:t.sectionID}}),t._v(" "),a("task-add-to-section-dialog",{attrs:{sectionID:t.sectionID}})],2)},staticRenderFns:[]};var p=a("VU/8")(d,u,!1,function(t){a("ZOQJ")},"data-v-c8ec9b2a",null);e.default=p.exports},ZOQJ:function(t,e){},a4JU:function(t,e){},hqvE:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a("Dd8w"),o=a.n(s),i=(a("IcnI"),a("NYxO")),n={name:"ciTaskFlow",data:function(){return{taskFlows:[],editFlow:0}},computed:o()({},Object(i.c)("citaskflow",["ciTaskFlowAdded"]),{taskFlowList:function(){return this.ciTaskFlowAdded&&(this.loadTaskFlows(),this.setCITaskFlowAdded(!1)),this.taskFlows}}),methods:o()({},Object(i.d)("citaskflow",["setCITaskFlowCreateDialogShow","setCITaskFlowAdded"]),{flowContextMenuClick:function(t){var e=this,a=t.split(":"),s=a[0],o=a[1];if(this.editFlow=o,"rename"===s)for(var i=0;i<this.taskFlowList.length;i++)if(this.taskFlowList[i].flowID+""===o){this.taskFlowList[i].taskFlowNameEdit=!0,this.taskFlowList[i].taskFlowNameView=!1;break}if("copy"===s&&this.copyTaskFlow(o),"delete"===s){var n=this.findTaskFlow(o).flowName;this.$Modal.confirm({title:"删除确认",content:"<p>删除是危险操作，确认要删除任务流 ["+n+" ] 吗？</p>",onOk:function(){e.deleteTaskFlow(o)},onCancel:function(){}})}},findTaskFlow:function(t){for(var e=null,a=0;a<this.taskFlowList.length;a++)if(this.taskFlowList[a].flowID+""===t){e=this.taskFlowList[a];break}return e},copyTaskFlow:function(t){var e=this;this.$axios.get("/api/ci/task_flow/"+t+"/copy").then(function(t){e.loadTaskFlows()},function(t){})},deleteTaskFlow:function(t){var e=this;this.$axios.delete("/api/ci/task_flow/"+t).then(function(t){e.loadTaskFlows()},function(t){})},flowNameEditComplete:function(){for(var t=0;t<this.taskFlowList.length;t++)if(this.taskFlowList[t].flowID+""===this.editFlow){this.taskFlowList[t].taskFlowNameEdit=!1,this.taskFlowList[t].taskFlowNameView=!0,this.updateTaskFlowName(this.editFlow,this.taskFlowList[t].flowName),this.editFlow=0;break}},loadTaskFlows:function(){var t=this;this.$axios.get("/api/ci/task_flow/my?page_size=10000").then(function(e){var a=e.data.result.results;t.taskFlows=[];for(var s=0;s<a.length;s++)t.taskFlows.push({flowID:a[s].id,flowName:a[s].FlowName,lastRunTime:a[s].LastRunTime,taskFlowNameEdit:!1,taskFlowNameView:!0})},function(t){})},updateTaskFlowName:function(t,e){this.$axios.patch("/api/ci/task_flow/"+t+"/",{FlowName:e}).then(function(t){},function(t){})},onStartTaskFlow:function(t){var e=this;this.$axios.get("/api/ci/task_flow/"+t+"/start").then(function(t){e.$Message.success({content:t.data.result.message,duration:10})},function(t){})}}),created:function(){this.loadTaskFlows()}},c={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",t._l(t.taskFlowList,function(e){return a("Card",{key:e.flowID,staticClass:"env_archive_folder",attrs:{padding:0}},[a("div",{staticClass:"env_archive_folder_header"},[a("span",{staticClass:"pull-right",staticStyle:{color:"#f0f0f0",padding:"5px"}},[a("Dropdown",{on:{"on-click":t.flowContextMenuClick}},[a("i",{staticClass:"fa fa-bars fa-fw"}),t._v(" "),a("DropdownMenu",{attrs:{slot:"list"},slot:"list"},[a("DropdownItem",{staticStyle:{height:"20px","padding-top":"2px","text-align":"left"},attrs:{name:"rename:"+e.flowID}},[a("span",{staticStyle:{"margin-right":"5px"}},[a("Icon",{attrs:{type:"md-create"}})],1),t._v(" "),a("span",[t._v("重命名")])]),t._v(" "),a("DropdownItem",{staticStyle:{height:"20px","padding-top":"2px","text-align":"left"},attrs:{name:"copy:"+e.flowID}},[a("span",{staticStyle:{"margin-right":"5px"}},[a("Icon",{attrs:{type:"ios-copy"}})],1),t._v(" "),a("span",[t._v("复制")])]),t._v(" "),a("DropdownItem",{staticStyle:{height:"20px","padding-top":"2px","text-align":"left"},attrs:{name:"delete:"+e.flowID}},[a("span",{staticStyle:{"margin-right":"5px"}},[a("Icon",{attrs:{type:"ios-trash"}})],1),t._v(" "),a("span",[t._v("删除")])])],1)],1)],1)]),t._v(" "),a("div",{staticClass:"env_archive_folder_body"},[e.taskFlowNameView?a("a",{staticStyle:{border:"none","background-color":"inherit","argin-right":"auto","margin-left":"auto",width:"80%","margin-top":"10px","font-size":"6px"},attrs:{href:"/ci/taskflow/"+e.flowID}},[a("span",{staticClass:"task-flow-title cursor-hand",staticStyle:{width:"100%","text-decoration":"underline"}},[t._v("\n\t\t                    "+t._s(e.flowName)+"\n\t\t                  ")])]):t._e(),t._v(" "),e.taskFlowNameEdit?a("div",[a("Input",{staticStyle:{width:"auto","padding-top":"25px","padding-left":"30px"},attrs:{name:"taskFlowName",size:"small",maxlength:50,autofocus:!0},on:{"on-blur":t.flowNameEditComplete},model:{value:e.flowName,callback:function(a){t.$set(e,"flowName",a)},expression:"taskFlow.flowName"}})],1):t._e()]),t._v(" "),a("div",{staticClass:"env_archive_folder_footer"},[a("center",[a("div",{staticClass:"env_archive_version_file"},[a("div",{staticStyle:{color:"inherit"},attrs:{href:"#"}},[a("Tooltip",{attrs:{content:"执行"}},[a("span",{on:{click:function(a){t.onStartTaskFlow(e.flowID)}}},[a("Icon",{attrs:{type:"md-play",size:18,color:"#555"}})],1)])],1)]),t._v(" "),e.lastRunTime?a("div",{staticStyle:{"font-size":"12px","margin-top":"6px"}},[a("Tooltip",{attrs:{content:"上次执行时间"}},[a("span",{staticStyle:{"margin-top":"0px","margin-left":"0px"}},[a("Icon",{staticStyle:{color:"#388e83"},attrs:{type:"ios-checkmark-circle"}}),t._v(" "+t._s(e.lastRunTime))],1)])],1):t._e()])],1)])}))},staticRenderFns:[]};var l=a("VU/8")(n,c,!1,function(t){a("I72q")},"data-v-2c3c0f31",null).exports,r={name:"CILogShowDialog",props:["taskID","tqID","taskUUID"],components:{},data:function(){return{log:"",preLog:"",preLogLink:!0,scrollToBottom:!0}},computed:o()({},Object(i.c)("citask",["ciLogDialogShow"]),{dialogShow:function(){return this.ciLogDialogShow},loginfo:function(){return this.log}}),methods:o()({},Object(i.d)("citask",["setCILogDialogShow"]),{cancel:function(){this.setCILogDialogShow(!1),this.preLog="",this.preLogLink=!0},showLogInfo:function(t){var e=this,a=new WebSocket("ws://teamcat.qyvideo.net/ws/"+this.tqID+"?subscribe-broadcast&publish-broadcast&echo");t?(a.onopen=function(){console.log("websocket connected")},a.onmessage=function(t){if("--heartbeat--"!==t.data&&(e.log=e.log+t.data+"</br>",e.scrollToBottom)){var a=document.getElementById("ciLogContainer");a.scrollTop=a.scrollHeight}},a.onerror=function(t){console.error(t)},a.onclose=function(t){console.log("connection closed")}):(a.close(),this.log="")},onViewOldLog:function(){var t=this;this.$axios.get("/api/ci/task/prelog/"+this.tqID).then(function(e){t.preLog=e.data.result.PreLog,t.preLogLink=!1},function(t){})}}),created:function(){},mounted:function(){}},d={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("Modal",{attrs:{value:t.dialogShow,title:"日志信息",styles:{bottom:"20px",top:"50px",width:"80%","margin-left":"auto","margin-right":"auto"}},on:{"on-visible-change":t.showLogInfo,"on-cancel":t.cancel}},[a("div",{staticStyle:{"text-align":"left"},attrs:{slot:"header"},slot:"header"},[a("span",[t._v("任务ID为 ["+t._s(t.taskID)+"] 的任务日志")]),t._v(" "),a("Checkbox",{staticClass:"pull-right",staticStyle:{"margin-right":"100px"},model:{value:t.scrollToBottom,callback:function(e){t.scrollToBottom=e},expression:"scrollToBottom"}},[t._v("默认滚动到底部")])],1),t._v(" "),a("div",{staticStyle:{height:"600px","overflow-y":"scroll","overflow-x":"hidden",color:"rgb(0, 255, 0)","background-color":"black",padding:"20px","word-break":"break-all"},attrs:{id:"ciLogContainer"}},[a("div",[t.preLogLink?a("div",[a("a",{on:{click:t.onViewOldLog}},[t._v("查看之前的日志")])]):t._e(),t._v(" "),a("div",{domProps:{innerHTML:t._s(t.preLog)}},[t._v(t._s(t.preLog))])]),t._v(" "),a("div",{domProps:{innerHTML:t._s(t.log)}},[t._v(t._s(t.log))])]),t._v(" "),a("div",{attrs:{slot:"footer"},slot:"footer"})])},staticRenderFns:[]};var u=a("VU/8")(r,d,!1,function(t){a("sOy+")},"data-v-151cefe6",null).exports,p={name:"ciAgent",data:function(){return{taskQueue:[],agents:[],taskID:0,taskUUID:"",tqID:0}},computed:o()({},Object(i.c)("citask",["ciLogDialogShow"])),methods:o()({},Object(i.d)("citask",["setCILogDialogShow"]),{cancleTask:function(t,e){var a=this;this.$axios.get("/api/ci/task_basic/"+t+"/stop/?TaskUUID="+e).then(function(t){a.$Message.success({content:t.data.result.message,duration:10})},function(t){a.$Message.error({content:t.data.result.message,duration:10})})},showCILog:function(t,e,a){this.taskID=t,this.taskUUID=e,this.tqID=a,console.log(this.tqID),this.setCILogDialogShow(!0)},loadTaskQueue:function(){var t=this;this.$axios.get("/api/common/task_queues?Status__in=1,2,3&Command=1").then(function(e){t.taskQueue=e.data.result},function(t){}),this.recivedTaskEnqueue=!1},loadAgent:function(){var t=this;this.$axios.get("/api/common/agents").then(function(e){console.log(e),t.agents=e.data.result},function(t){})},onReciveTaskStatusChange:function(){var t=this,e=new WebSocket("ws://teamcat.qyvideo.net/ws/TASKSTATUSCHANGE?subscribe-broadcast&publish-broadcast&echo");e.onopen=function(){console.log("task enqueue websocket connected")},e.onmessage=function(e){"--heartbeat--"!==e.data&&(setTimeout(t.loadTaskQueue,1e4),setTimeout(t.loadAgent,1e4))},e.onerror=function(t){console.error(t)},e.onclose=function(t){console.log("connection closed")}}}),created:function(){this.loadTaskQueue(),this.loadAgent(),this.onReciveTaskStatusChange()},components:{CILogShowDialog:u}},f={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("Card",{staticStyle:{"margin-top":"10px"},attrs:{"dis-hover":"",bordered:!1}},[a("div",{staticClass:"citask-card-title"},[a("Icon",{attrs:{type:"ios-list-box-outline"}}),t._v(" 任务队列")],1),t._v(" "),a("div",t._l(t.taskQueue,function(e){return a("div",{key:e.TaskUUID,staticStyle:{height:"40px","border-bottom":"1px solid #f5f7f9","padding-top":"12px"}},[a("span",{staticStyle:{width:"70%",display:"inline-block","text-align":"left","padding-left":"10px",overflow:"hidden","text-overflow":"ellipsis","white-space":"nowrap"}},[a("Icon",{attrs:{type:"ios-clock-outline"}}),t._v(" "+t._s(e.TaskName))],1),t._v(" "),a("span",{staticStyle:{width:"20%",display:"inline-block"}},[t._v(t._s(e.TriggerName))]),t._v(" "),a("Tooltip",{staticStyle:{width:"10%"},attrs:{content:"取消任务"}},[a("span",{staticClass:"cursor-hand",staticStyle:{width:"20%",display:"inline-block"},on:{click:function(a){t.cancleTask(e.TaskID,e.TaskUUID)}}},[a("Icon",{staticStyle:{"padding-right":"5px"},attrs:{type:"md-close",size:18}})],1)])],1)}))]),t._v(" "),a("Card",{staticStyle:{"margin-top":"10px"},attrs:{"dis-hover":"",bordered:!1}},[a("div",{staticClass:"citask-card-title"},[a("span",[a("Icon",{attrs:{type:"md-laptop"}}),t._v(" Agent")],1),t._v(" "),a("span",{staticStyle:{"margin-left":"20px"}},[a("span",[a("Icon",{attrs:{type:"ios-ionic"}}),t._v(" 离线")],1),t._v(" "),a("span",{staticStyle:{"margin-left":"20px",color:"#388e8e"}},[a("Icon",{attrs:{type:"ios-ionic"}}),t._v(" 在线")],1)])]),t._v(" "),a("div",[t._l(t.agents,function(e){return e.RunningTasks.length>0?a("div",{key:e.id,staticStyle:{"border-bottom":"1px solid #f5f7f9","padding-top":"12px"}},[a("div",{staticStyle:{"text-align":"left"}},[a("span",{staticStyle:{"padding-left":"10px","padding-right":"5px"}},[2===e.Status?a("Icon",{staticStyle:{color:"#388e8e"},attrs:{type:"md-checkmark-circle-outline",size:14}}):t._e(),t._v(" "),2!==e.Status?a("Icon",{attrs:{type:"ios-checkmark-circle-outline",size:14}}):t._e()],1),t._v(" "),a("span",{staticStyle:{"padding-right":"5px"}},[t._v(t._s(e.Name))])]),t._v(" "),t._l(e.RunningTasks,function(e){return a("div",{staticStyle:{"padding-left":"20px","padding-top":"10px"}},[a("span",{staticStyle:{width:"60%",display:"inline-block","text-align":"left","padding-left":"10px",overflow:"hidden","text-overflow":"ellipsis","white-space":"nowrap"}},[a("span",{staticStyle:{display:"block"}},[t._v(t._s(e.TaskName))]),t._v(" "),a("Progress",{attrs:{percent:e.Process,"stroke-width":5,status:"success","hide-info":!0}})],1),t._v(" "),a("Tooltip",{staticStyle:{width:"15%"},attrs:{content:"触发着"}},[a("span",{staticStyle:{width:"100%",display:"inline-block"}},[t._v(t._s(e.TriggerName))])]),t._v(" "),a("Tooltip",{staticStyle:{width:"15%"},attrs:{content:"点击查看日志"}},[a("span",{staticClass:"cursor-hand",staticStyle:{width:"100%",display:"inline-block"},on:{click:function(a){t.showCILog(e.TaskID,e.TaskUUID,e.TQID)}}},[t._v("日志 ")])]),t._v(" "),a("Tooltip",{staticStyle:{width:"10%"},attrs:{content:"取消任务"}},[a("span",{staticClass:"cursor-hand",staticStyle:{width:"100%",display:"inline-block"},on:{click:function(a){t.cancleTask(e.TaskID,e.TaskUUID)}}},[a("Icon",{staticStyle:{"padding-right":"5px"},attrs:{type:"md-close",size:18}})],1)])],1)})],2):t._e()}),t._v(" "),t._l(t.agents,function(e){return 0===e.RunningTasks.length?a("div",{key:e.id,staticStyle:{"border-bottom":"1px solid #f5f7f9","padding-top":"12px"}},[a("div",{staticStyle:{"text-align":"left"}},[a("span",{staticStyle:{"padding-left":"10px","padding-right":"5px"}},[2===e.Status?a("Icon",{staticStyle:{color:"#388e8e"},attrs:{type:"md-checkmark-circle-outline",size:14}}):t._e(),t._v(" "),2!==e.Status?a("Icon",{attrs:{type:"ios-checkmark-circle-outline",size:14}}):t._e()],1),t._v(" "),a("span",{staticStyle:{"padding-right":"5px"}},[t._v(t._s(e.Name))])]),t._v(" "),t._l(e.RunningTasks,function(e){return a("div",{staticStyle:{"padding-left":"20px","padding-top":"10px"}},[a("span",{staticStyle:{width:"60%",display:"inline-block","text-align":"left","padding-left":"10px",overflow:"hidden","text-overflow":"ellipsis","white-space":"nowrap"}},[t._v("\n               "+t._s(e.TaskName))]),t._v(" "),a("span",{staticClass:"cursor-hand",staticStyle:{width:"20%",display:"inline-block"},on:{click:function(a){t.showCILog(e.TaskID,e.TaskUUID,e.TQID)}}},[t._v("日志")])])})],2):t._e()})],2)]),t._v(" "),a("c-i-log-show-dialog",{attrs:{taskID:t.taskID,taskUUID:t.taskUUID,tqID:t.tqID}})],1)},staticRenderFns:[]};var h=a("VU/8")(p,f,!1,function(t){a("qKoX")},"data-v-2818ae78",null).exports,k=a("F3h5"),m={name:"ciTask",data:function(){return{myCITask:{count:0,next:"",items:[]}}},computed:o()({},Object(i.c)("citask",["ciTaskSearchKey","ciTaskAdded"]),{ciTaskCount:function(){return this.myCITask.count},myCITaskList:function(){return""===this.ciTaskSearchKey?this.initCITaskStatus():this.filterCITask(this.ciTaskSearchKey),this.ciTaskAdded&&(this.loadCITaskList(),this.setCITaskAdded(!1)),this.myCITask}}),methods:o()({},Object(i.d)("citask",["setCITaskAdded"]),{loadCITaskList:function(){var t=this;this.$axios.get("/api/ci/task_basic/my?page_size=100").then(function(e){t.myCITask.count=e.data.result.count,t.myCITask.next=e.data.result.next,t.myCITask.items=e.data.result.results,t.$Spin.hide()},function(e){t.$Spin.hide()})},filterCITask:function(t){this.initCITaskStatus();for(var e=0;e<this.myCITask.items.length;e++){var a=this.myCITask.items[e];a.TaskName.toUpperCase().indexOf(t.toUpperCase())<0&&(a.Display=!1,this.myCITask.count--)}},initCITaskStatus:function(){this.myCITask.count=this.myCITask.items.length;for(var t=0;t<this.myCITask.items.length;t++){this.myCITask.items[t].Display=!0}}}),mounted:function(){0===this.ciTaskCount&&this.$Spin.show()},created:function(){this.loadCITaskList()},watch:{ciTaskCount:function(){0!==this.ciTaskCount&&this.$Spin.hide()}},components:{ciTaskItem:k.a}},g={render:function(){var t=this.$createElement,e=this._self._c||t;return e("div",this._l(this.myCITaskList.items,function(t){return e("ci-task-item",{key:t.id,attrs:{item:t}})}))},staticRenderFns:[]};var v=a("VU/8")(m,g,!1,function(t){a("9Yyx")},"data-v-1c95f901",null).exports,w=a("XGNi"),I={Project:[{type:"integer",required:!0,message:"请选择项目或者创建项目后再创建任务！"}],TaskName:[{type:"string",required:!0,min:1,max:50,message:"标题长度必须在1-50个字符之间！",trigger:"blur"}],TaskType:[{type:"integer",required:!0,message:"任务类型是必选项"}],CopyTaskID:[{type:"integer",message:"请选择要复制的任务"}]},T=a("h/Zt"),y={name:"CITaskCreateDialog",data:function(){return{projects:[],ciTaskList:[],showTaskList:!0,formItem:{CopyTaskID:0,TaskName:"",Project:0,TaskType:0,HistoryCleanStrategy:10},ruleCustom:o()({},I)}},computed:o()({},Object(i.c)("citask",["ciTaskCreateDialogShow"])),methods:o()({},Object(i.d)("citask",["setCITaskCreateDialogShow","setCITaskAdded"]),{addCITask:function(t){var e=this;this.$refs[t].validate(function(t){t&&e.$axios.post("/api/ci/task_basic/list",e.formItem).then(function(t){e.setCITaskCreateDialogShow(!1),e.setCITaskAdded(!0)},function(t){e.setCITaskCreateDialogShow(!1),e.$Message.error({content:"创建任务失败，请联系管理员或者重试",duration:10})})})},cancel:function(){this.setCITaskCreateDialogShow(!1)},onTaskTypeChange:function(t){this.showTaskList=0===t},loadMyProject:function(){var t=this;this.$axios.get("/api/project/list?extinfo=1&home=1").then(function(e){t.projects=e.data.result},function(t){})},loadMyCITasks:function(){var t=this;this.$axios.get("/api/ci/task_basic/my?page_size=10000").then(function(e){t.ciTaskList=e.data.result.results},function(t){})}}),created:function(){this.loadMyProject(),this.loadMyCITasks()},mounted:function(){},watch:{},components:{FormItem:T.a}},_={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("Modal",{attrs:{value:t.ciTaskCreateDialogShow,title:"添加新任务",width:600,styles:{bottom:"20px",top:"50px"}},on:{"on-cancel":t.cancel}},[a("div",{staticStyle:{height:"600px","overflow-y":"scroll","overflow-x":"hidden"}},[a("Form",{ref:"ciTaskCreate",attrs:{model:t.formItem,"label-width":80,rules:t.ruleCustom}},[a("FormItem",{attrs:{label:"项目",prop:"Project"}},[a("Select",{attrs:{filterable:!0,placeholder:"请选择项目"},model:{value:t.formItem.Project,callback:function(e){t.$set(t.formItem,"Project",e)},expression:"formItem.Project"}},t._l(t.projects,function(e){return a("Option",{key:e.id,attrs:{value:e.id}},[a("span",{staticStyle:{"margin-right":"10px"}},[a("Avatar",{attrs:{src:"http://teamcat.qyvideo.net/"+e.PBAvatar}})],1),t._v(" "),a("span",[t._v(t._s(e.PBTitle))])])}))],1),t._v(" "),a("FormItem",{attrs:{label:"标题",prop:"TaskName"}},[a("Input",{attrs:{placeholder:"任务名称50个字符以内！"},model:{value:t.formItem.TaskName,callback:function(e){t.$set(t.formItem,"TaskName",e)},expression:"formItem.TaskName"}})],1),t._v(" "),a("FormItem",{attrs:{label:"构建记录保留个数",prop:"HistoryCleanStrategy"}},[a("Input",{attrs:{placeholder:"默认10个"},model:{value:t.formItem.HistoryCleanStrategy,callback:function(e){t.$set(t.formItem,"HistoryCleanStrategy",e)},expression:"formItem.HistoryCleanStrategy"}})],1),t._v(" "),a("FormItem",{attrs:{label:"任务类型",prop:"TaskType"}},[a("Select",{attrs:{filterable:!0,placeholder:"任务类型"},on:{"on-change":t.onTaskTypeChange},model:{value:t.formItem.TaskType,callback:function(e){t.$set(t.formItem,"TaskType",e)},expression:"formItem.TaskType"}},[a("Option",{key:0,attrs:{value:0}},[t._v("复制任务")]),t._v(" "),a("Option",{key:4,attrs:{value:4}},[t._v("构建")]),t._v(" "),a("Option",{key:1,attrs:{value:1}},[t._v("测试")]),t._v(" "),a("Option",{key:5,attrs:{value:5}},[t._v("部署")])],1)],1),t._v(" "),t.showTaskList?a("FormItem",{attrs:{label:"任务列表",prop:"CopyTaskID"}},[a("Select",{attrs:{filterable:!0,placeholder:"复制任务列表"},model:{value:t.formItem.CopyTaskID,callback:function(e){t.$set(t.formItem,"CopyTaskID",e)},expression:"formItem.CopyTaskID"}},t._l(t.ciTaskList,function(e){return a("Option",{key:e.id,attrs:{value:e.id}},[t._v(t._s(e.TaskName))])}))],1):t._e()],1)],1),t._v(" "),a("div",{attrs:{slot:"footer"},slot:"footer"},[t.ciTaskCreateDialogShow?a("Button",{staticStyle:{width:"80px",height:"30px"},attrs:{type:"success",shape:"circle"},on:{click:function(e){t.addCITask("ciTaskCreate")}}},[t._v("添加")]):t._e()],1)])},staticRenderFns:[]};var C=a("VU/8")(y,_,!1,function(t){a("UxPt")},"data-v-f4b02b92",null).exports,S={Project:[{type:"integer",required:!0,message:"请选择项目或者创建项目后再创建任务流！"}],FlowName:[{type:"string",required:!0,min:1,max:50,message:"标题长度必须在1-50个字符之间！",trigger:"blur"}],Description:[{type:"string",required:!1,max:50,message:"描述信息长度不超过200个字符！",trigger:"blur"}]},x={name:"CITaskFlowCreateDialog",data:function(){return{projects:[],ciTaskTransfer:{ciTasks:[],targetKeys:[],titles:["我的任务","添加的任务"],listStyle:{height:"249px"}},formItem:{FlowName:"",Project:0,CITasks:[]},ruleCustom:o()({},S)}},computed:o()({},Object(i.c)("citaskflow",["ciTaskFlowCreateDialogShow"])),methods:o()({},Object(i.d)("citaskflow",["setCITaskFlowCreateDialogShow","setCITaskFlowAdded"]),{addCITaskFlow:function(t){var e=this;this.$refs[t].validate(function(t){t&&e.$axios.post("/api/ci/task_flow/list",e.formItem).then(function(t){e.setCITaskFlowCreateDialogShow(!1),e.setCITaskFlowAdded(!0)},function(t){e.setCITaskFlowCreateDialogShow(!1),e.$Message.error({content:"创建任务流失败，请联系管理员或者重试",duration:10})})})},cancel:function(){this.setCITaskFlowCreateDialogShow(!1)},transferRender:function(t){return t.label},moveCITasks:function(t){this.ciTaskTransfer.targetKeys=t,this.formItem.CITasks=t,console.log(this.formItem)},transferFilterMethod:function(t,e){return t.label.toUpperCase().indexOf(e.toUpperCase())>-1},loadMyCITasks:function(){var t=this;this.$axios.get("/api/ci/task_basic/my?page_size=10000").then(function(e){for(var a=e.data.result.results,s=0;s<a.length;s++)t.ciTaskTransfer.ciTasks.push({key:a[s].id,label:a[s].TaskName,description:a[s].Description})},function(t){})},loadFlowCITasks:function(){},loadMyProject:function(){var t=this;this.$axios.get("/api/project/list?extinfo=1&home=1").then(function(e){t.projects=e.data.result},function(t){})}}),created:function(){this.loadMyCITasks(),this.loadFlowCITasks(),this.loadMyProject()},mounted:function(){},watch:{},components:{FormItem:T.a}},F={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("Modal",{attrs:{value:t.ciTaskFlowCreateDialogShow,title:"添加新任务流",width:600,styles:{bottom:"20px",top:"50px"}},on:{"on-cancel":t.cancel}},[a("div",{staticStyle:{height:"400px","overflow-y":"scroll","overflow-x":"hidden"}},[a("Form",{ref:"ciTaskFlowCreate",attrs:{model:t.formItem,"label-width":80,rules:t.ruleCustom}},[a("FormItem",{attrs:{label:"项目",prop:"Project"}},[a("Select",{attrs:{filterable:!0,placeholder:"请选择项目"},model:{value:t.formItem.Project,callback:function(e){t.$set(t.formItem,"Project",e)},expression:"formItem.Project"}},t._l(t.projects,function(e){return a("Option",{key:e.id,attrs:{value:e.id}},[a("span",{staticStyle:{"margin-right":"10px"}},[a("Avatar",{attrs:{src:"http://teamcat.qyvideo.net/"+e.PBAvatar}})],1),t._v(" "),a("span",[t._v(t._s(e.PBTitle))])])}))],1),t._v(" "),a("FormItem",{attrs:{label:"标题",prop:"FlowName"}},[a("Input",{attrs:{placeholder:"任务流名称50个字符以内！"},model:{value:t.formItem.FlowName,callback:function(e){t.$set(t.formItem,"FlowName",e)},expression:"formItem.FlowName"}})],1),t._v(" "),a("FormItem",{attrs:{label:"添加任务",prop:"FlowTaskList"}},[a("Transfer",{attrs:{data:t.ciTaskTransfer.ciTasks,"target-keys":t.ciTaskTransfer.targetKeys,"render-format":t.transferRender,filterable:!0,"filter-method":t.transferFilterMethod,titles:t.ciTaskTransfer.titles,"list-style":t.ciTaskTransfer.listStyle},on:{"on-change":t.moveCITasks}})],1)],1)],1),t._v(" "),a("div",{attrs:{slot:"footer"},slot:"footer"},[t.ciTaskFlowCreateDialogShow?a("Button",{staticStyle:{width:"80px",height:"30px"},attrs:{type:"success",shape:"circle"},on:{click:function(e){t.addCITaskFlow("ciTaskFlowCreate")}}},[t._v("添加")]):t._e()],1)])},staticRenderFns:[]};var D=a("VU/8")(x,F,!1,function(t){a("9kBX")},"data-v-3b466dee",null).exports,b={name:"ciTaskContainer",props:["menuItem","flowID"],data:function(){return{toDoSummary:{taskCount:0,issueCount:0,fortestingCount:0},activeProject:[],activity:{next:"",data:[],count:0}}},computed:o()({},Object(i.c)(["appBodyHeight"]),{taskContainerHeight:function(){return this.appBodyHeight-33},agentContainerHeight:function(){return this.appBodyHeight-33}}),components:{CITaskFlowCreateDialog:D,CITaskCreateDialog:C,ciAgent:h,ciTaskFlow:l,ciTask:v,ciTaskFlowItem:w.default}},L={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"ci-task-container"},[a("Row",{attrs:{gutter:16}},[a("Col",{style:"height:"+t.taskContainerHeight+"px; overflow-y:scroll;",attrs:{lg:16,md:16,sm:12,xs:24}},[a("div",["taskflow"===t.menuItem?a("ci-task-flow"):t._e(),t._v(" "),"task"===t.menuItem?a("ci-task"):t._e(),t._v(" "),""!==t.flowID?a("ci-task-flow-item",{attrs:{taskFlowID:t.flowID}}):t._e()],1)]),t._v(" "),a("Col",{style:"height:"+t.agentContainerHeight+"px; overflow-y:scroll;",attrs:{lg:8,md:8,sm:12,xs:0}},[a("div",[a("ci-agent")],1)])],1),t._v(" "),a("c-i-task-create-dialog"),t._v(" "),a("c-i-task-flow-create-dialog")],1)},staticRenderFns:[]};var $=a("VU/8")(b,L,!1,function(t){a("x6EP")},"data-v-63fb968c",null);e.default=$.exports},qKoX:function(t,e){},"sOy+":function(t,e){},x6EP:function(t,e){}});
//# sourceMappingURL=5.7eb8afcd9a95ecf52f62.js.map