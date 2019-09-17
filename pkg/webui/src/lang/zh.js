export default {
  route: {
    dashboard: '首页',
    page401: '401',
    page404: '404',
    errorLog: '错误日志',
    theme: '换肤',
    permission: '权限管理',
    user: '用户管理',
    dept: '部门管理',
    member: '用户管理',
    domain: '项目管理',
    role: '角色管理',
    system: '系统设置',
    menu: '菜单管理',
    params: '参数管理',
    logs: '日志管理',
    log_login: '登录日志',
    log_operation: '操作日志',
    log_error: '异常日志',
    dataPerm: '数据权限',
    personal: '个人中心',
    psw: '修改密码',
    third: '第三方绑定'
  },
  navbar: {
    logOut: '退出登录',
    password: '修改密码',
    dashboard: '首页',
    github: '项目地址',
    screenfull: '全屏',
    theme: '换肤',
    size: '布局大小',
    binding: '绑定钉钉',
    personal: '个人中心'
  },
  login: {
    title: 'System LogIn', // 考虑到其他系统，默认实用英文
    logIn: 'LogIn',
    username: 'Account',
    password: 'Password',
    // title: '系统登录',
    // logIn: '登录',
    // username: '账号',
    // password: '密码',
    any: '随便填',
    captcha: '验证码',
    thirdparty: '第三方登录',
    thirdpartyTips: '本地不能模拟，请结合自己业务进行模拟！！！'
  },
  documentation: {
    documentation: '文档',
    github: 'Github 地址'
  },
  permission: {
    roles: '你的权限',
    switchRoles: '切换权限'
  },
  guide: {
    description:
      '引导页对于一些第一次进入项目的人很有用，你可以简单介绍下项目的功能。本 Demo 是基于',
    button: '打开引导'
  },
  components: {
    documentation: '文档',
    tinymceTips:
      '富文本是管理后台一个核心的功能，但同时又是一个有很多坑的地方。在选择富文本的过程中我也走了不少的弯路，市面上常见的富文本都基本用过了，最终权衡了一下选择了Tinymce。更详细的富文本比较和介绍见',
    dropzoneTips:
      '由于我司业务有特殊需求，而且要传七牛 所以没用第三方，选择了自己封装。代码非常的简单，具体代码你可以在这里看到 @/components/Dropzone',
    stickyTips: '当页面滚动到预设的位置会吸附在顶部',
    backToTopTips1: '页面滚动到指定位置会在右下角出现返回顶部按钮',
    backToTopTips2:
      '可自定义按钮的样式、show/hide、出现的高度、返回的位置 如需文字提示，可在外部使用Element的el-tooltip元素',
    imageUploadTips:
      '由于我在使用时它只有vue@1版本，而且和mockjs不兼容，所以自己改造了一下，如果大家要使用的话，优先还是使用官方版本。'
  },
  table: {
    dynamicTips1: '固定表头, 按照表头顺序排序',
    dynamicTips2: '不固定表头, 按照点击顺序排序',
    dragTips1: '默认顺序',
    dragTips2: '拖拽后顺序',
    title: '标题',
    importance: '重要性',
    type: '类型',
    remark: '点评',
    search: '搜索',
    add: '添加',
    export: '导出',
    reviewer: '审核人',
    id: '序号',
    date: '时间',
    author: '作者',
    readings: '阅读数',
    status: '状态',
    actions: '操作',
    edit: '编辑',
    copy: '复制',
    publish: '发布',
    draft: '草稿',
    delete: '删除',
    cancel: '取 消',
    confirm: '确 定',
    disable: '停用',
    enable: '正常',
    move: '移出',
    reset: '重置密码',
    look: '查看用户',
    move_all: '批量移出'
  },
  errorLog: {
    tips: '请点击右上角bug小图标',
    description:
      '现在的管理后台基本都是spa的形式了，它增强了用户体验，但同时也会增加页面出问题的可能性，可能一个小小的疏忽就导致整个页面的死锁。好在 Vue 官网提供了一个方法来捕获处理异常，你可以在其中进行错误处理或者异常上报。',
    documentation: '文档介绍'
  },
  excel: {
    export: '导出',
    selectedExport: '导出已选择项',
    placeholder: '请输入文件名(默认excel-list)'
  },
  zip: {
    export: '导出',
    placeholder: '请输入文件名(默认file)'
  },
  theme: {
    change: '换肤',
    documentation: '换肤文档',
    tips:
      'Tips: 它区别于 navbar 上的 theme-pick, 是两种不同的换肤方法，各自有不同的应用场景，具体请参考文档。'
  },
  tagsView: {
    refresh: '刷新',
    close: '关闭',
    closeOthers: '关闭其它',
    closeAll: '关闭所有'
  },
  user: {
    search: '用户名',
    id: 'ID',
    username: '用户名',
    department: '部门',
    email: '邮箱',
    mobile: '手机号',
    status: '状态',
    date: '创建时间',
    actions: '操作',
    password: '密码',
    repassword: '确认密码',
    nickname: '真实姓名',
    realname: '姓名',
    sex: '性别',
    role: '角色',
    title: '职位',
    remark: '角色配置',
    Edit: '编辑',
    Create: '新建',
    Move: '移动用户',
    move_department: '新部门'
  },
  role: {
    search: '用户名',
    id: 'ID',
    name: '角色名',
    remark: '备注',
    domain: '项目域',
    date: '创建时间',
    actions: '操作',
    dept: '项目',
    menuscope: '角色权限',
    datascope: '数据权限'
  },
  dept: {
    id: 'ID',
    name: '名称',
    remark: '备注',
    callbackurl: '链接',
    parents: '上级菜单',
    topnum: '排序',
    created_time: '创建时间',
    updated_time: '修改时间',
    Edit: '编辑',
    Create: '新建',
    actions: '操作'
  },
  domain: {
    id: 'ID',
    name: '名称',
    remark: '备注',
    code: '标识',
    callbackurl: '链接',
    parents: '上级菜单',
    topnum: '排序',
    created_time: '创建时间',
    updated_time: '修改时间',
    Edit: '编辑',
    Create: '新建',
    actions: '操作'
  },
  menu: {
    id: 'ID',
    name: '名称',
    icon: '图标',
    parents: '上级菜单',
    type: '类型',
    topnum: '排序',
    router: '路由',
    auth: '授权标识',
    Edit: '编辑',
    Create: '新建',
    actions: '操作',
    type_directories: '目录',
    type_menu: '菜单',
    type_button: '按钮'
  },
  dataPerm: {
    type: '类型',
    rules: '权限规则',
    router: '路由',
    remarks: '说明',
    type_sort: '分类',
    type_data: '数据权限',
    parents: '分类',
    topnum: '排序',
    name: '名称',
    actions: '操作'
  }
}
