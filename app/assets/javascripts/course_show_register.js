window.onload = function () {
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!',
      course: {
        "id": 0,
        "course_name":"",
        "quantity_registered":0,
        "start_time": "",
        "description":"",
        "price":0,
        "created_at":"",
        "updated_at":"",
        "name_subject":""
      }
    },
    methods: {
      getCourse(id) {
        const self = this;
        axios.get('/courses/'+id)
        .then(function (response) {
          course = response.data.course
          subject = response.data.subject[0]
          self.course = course
          self.course.name_subject = subject.name_subject
        })
        .catch(function (error) {
          console.log(error);
        });
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
