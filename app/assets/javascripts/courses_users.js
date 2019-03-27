window.onload = function () {
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!',
      course_user: {
        "email": "",
        "fullname_user": "",
        "course_name": "",
        "created_at": "",
        "name_subject": "",
        "debit": ""
      }
    },
    methods: {
      setCourseUser(object) {
        const self = this;
        self.course_user = object
        console.log(self.course_user)
      },
      formatNumber(str){
        str = str.toString()
        var n = parseInt(str.replace(/\D/g,''),10);
        str = n.toLocaleString().replace(/\,/g, '.')
        return str
      }
    }
  })
}
