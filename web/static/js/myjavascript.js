function require_mobile()
{
  var str=document.getElementById("mobile").value;
  var patt=/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
  var flag=patt.test(str);
  if (str.length==0)
  { 
      document.getElementById("error-mobile").style.display="none";
      document.getElementById("right-mobile").style.display="none";
      document.getElementById("require-mobile").style.display="";
  }
  else if (flag==false) {
      document.getElementById("require-mobile").style.display="none";
      document.getElementById("right-mobile").style.display="none";
      document.getElementById("error-mobile").style.display="";
  }
  else if (flag)
  {
      document.getElementById("require-mobile").style.display="none";
      document.getElementById("error-mobile").style.display="none";
      document.getElementById("right-mobile").style.display="";
  }
}
function require_name()
{
  var str=document.getElementById("name").value;
  var patt=/^[\u4e00-\u9fa5]{1,7}$|^[\dA-Za-z_]{1,14}$/;
  var flag=patt.test(str);
  if (str.length==0)
  { 
      document.getElementById("error-name").style.display="none";
      document.getElementById("right-name").style.display="none";
      document.getElementById("require-name").style.display="";
  }
  else if (flag==false) {
      document.getElementById("require-name").style.display="none";
      document.getElementById("right-name").style.display="none";
      document.getElementById("error-name").style.display="";
  }
  else if (flag)
  {
      document.getElementById("require-name").style.display="none";
      document.getElementById("error-name").style.display="none";
      document.getElementById("right-name").style.display="";
  }
}
function require_pwd()
{
  var str=document.getElementById("pwd").value;
  var patt=/^(\w){6,16}$/;
  var flag=patt.test(str);
  if (str.length==0)
  { 
      document.getElementById("error-pwd").style.display="none";
      document.getElementById("right-pwd").style.display="none";
      document.getElementById("require-pwd").style.display="";
  }
  else if (flag==false) {
      document.getElementById("require-pwd").style.display="none";
      document.getElementById("right-pwd").style.display="none";
      document.getElementById("error-pwd").style.display="";
  }
  else if (flag)
  {
      document.getElementById("require-pwd").style.display="none";
      document.getElementById("error-pwd").style.display="none";
      document.getElementById("right-pwd").style.display="";
  }
}
function require_truename()
{
  var str=document.getElementById("truename").value;
  var patt=/(^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,10})$)|(^([a-zA-Z\\s]+)$)/;
  var flag=patt.test(str);
  if (str.length==0)
  { 
      document.getElementById("error-truename").style.display="none";
      document.getElementById("right-truename").style.display="none";
      document.getElementById("require-truename").style.display="";
  }
  else if (flag==false||str.length==1) {
      document.getElementById("require-truename").style.display="none";
      document.getElementById("right-truename").style.display="none";
      document.getElementById("error-truename").style.display="";
  }
  else if (flag)
  {
      document.getElementById("require-truename").style.display="none";
      document.getElementById("error-truename").style.display="none";
      document.getElementById("right-truename").style.display="";
  }
}
function require_idcard()
{
  var str=document.getElementById("idcard").value;
  var patt=/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx])|([1−9]\d5\d2((0[1−9])|(10|11|12))(([0−2][1−9])|10|20|30|31)\d2[0−9Xx])/;
  var flag=patt.test(str);
  if (str.length==0)
  { 
      document.getElementById("error-idcard").style.display="none";
      document.getElementById("right-idcard").style.display="none";
      document.getElementById("require-idcard").style.display="";
  }
  else if (flag==false) {
      document.getElementById("require-idcard").style.display="none";
      document.getElementById("right-idcard").style.display="none";
      document.getElementById("error-idcard").style.display="";
  }
  else if (flag)
  {
      document.getElementById("require-idcard").style.display="none";
      document.getElementById("error-idcard").style.display="none";
      document.getElementById("right-idcard").style.display="";
  }
}
function require_email()
{
  var str=document.getElementById("email").value;
  var patt=/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
  var flag=patt.test(str);
  if (str.length==0)
  { 
      document.getElementById("error-email").style.display="none";
      document.getElementById("right-email").style.display="none";
      document.getElementById("require-email").style.display="";
  }
  else if (flag==false) {
      document.getElementById("require-email").style.display="none";
      document.getElementById("right-email").style.display="none";
      document.getElementById("error-email").style.display="";
  }
  else if (flag)
  {
      document.getElementById("require-email").style.display="none";
      document.getElementById("error-email").style.display="none";
      document.getElementById("right-email").style.display="";
  }
}

function loginyanzhengmacuowu() {
    document.getElementById("error-code").style.display="none";
}

function loginaccount_error(){
  document.getElementById("loginaccount-error").style.display="none";
}
function loginpwd_error(){
  document.getElementById("loginpwd-error").style.display="none";
}



function require_name1()
{
  var str=document.getElementById("name1").value;
  var patt=/^[\u4e00-\u9fa5]{1,7}$|^[\dA-Za-z_]{1,14}$/;
  var flag=patt.test(str);
  if (str.length==0)
  { 
      document.getElementById("error-name1").style.display="none";
      document.getElementById("right-name1").style.display="none";
  }
  else if (flag==false) {
      document.getElementById("right-name1").style.display="none";
      document.getElementById("error-name1").style.display="";
  }
  else if (flag)
  {
      document.getElementById("error-name1").style.display="none";
      document.getElementById("right-name1").style.display="";
  }
}
function require_email1()
{
  var str=document.getElementById("email1").value;
  var patt=/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
  var flag=patt.test(str);
  if (str.length==0)
  { 
      document.getElementById("error-email1").style.display="none";
      document.getElementById("right-email1").style.display="none";
  }
  else if (flag==false) {
      document.getElementById("right-email1").style.display="none";
      document.getElementById("error-email1").style.display="";
  }
  else if (flag)
  {
      document.getElementById("error-email1").style.display="none";
      document.getElementById("right-email1").style.display="";
  }
}