<!DOCTYPE html>
<html>
<head>
    <title>student details</title>
</head>
<body>
    Pick your rollnumber:
    <select id="stud" onchange="showStudent()">
          
           <option value="1">210701275</option>
           <option value="2">210701288</option>
           <option value="3">210701112</option>
    </select>
    <div id="div1"></div>
    <script>
        function showStudent(){
            var stud1=document.getElementById("stud");
            var newstud1=stud1.val;
            if(newstud1)
            {
                var xhr=new XMLHttpRequest();
                xhr.onreadystatechange=function()
                {
                    if(xhr.readyState==4 && xhr.status==200)
                    {
                        var studdetails=document.getElementById("div1");
                        studdetails.innerHTML=xhr.responseText;
                    }
                };
                xhr.open("GET","getstudent.jsp?id=" + newstud1,true);
                xhr.send();
            }
            else{
                studdetails.innerHTML="";
            }
        }
        
    </script>
</body>

</html>