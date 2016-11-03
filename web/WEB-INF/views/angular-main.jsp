<!-- обратите внимание на spring тэги -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
  <title>Index Page</title>
  <!-- AngularJS min production resource -->
  <spring:url value="/resources/angular.min.js" var="angularresource" />
  <script src="${angularresource}"></script>
</head>

<body>
<spring-form:form method="post"  modelAttribute="userJSP" action="check-user">

  Name: <spring-form:input path="name"/> (path="" - указывает путь, используемый в modelAttribute=''. в нашем случае User.name)  <br/>
  Password: <spring-form:input path="password"/>   <br/>
  <spring-form:button>Next Page</spring-form:button>
  <spring-form:button>Angular</spring-form:button>

</spring-form:form>

<script>
  var app = angular.module('application', []);
  app.filter('greet', function(){
    return function(name){
      return 'Hello, ' + name + '!';
    };
  });

  var myApp = angular.module('myApp', []);
  myApp.controller('GreetingController', function($scope) {
    $scope.greeting = 'Preved, medved!';
  });
</script>

<div ng-app="application">
  <div>
    {{'World'|greet}}
  </div>
</div>

<div ng-app="myApp" ng-controller="GreetingController">
  <div>
    {{5+5}}
  </div>
</div>

</body>

</html>
