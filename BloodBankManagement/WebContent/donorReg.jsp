<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
function init(){

	if('<%=request.getSession().getAttribute("submitFlag")%>' == 'inserted'  ){
		<%request.getSession().removeAttribute("submitFlag");%>
		alert('Registration Completed');
	}
}
</script>
</head>

<body onload="init()">

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="index.jsp">
                        Home
                    </a>
                </li>
                <li>
                    <a href="donorReg.jsp">Donor Registration</a>
                </li>
                <li>
                    <a href="donorSearch.jsp">Search Donor</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row text-center">
                <br>
                    <div class="col-lg-8 col-lg-offset-2" >
                        <h1>Donor Registration</h1>
                        
                        <br>
                        <form class="form-horizontal" role="form" action="DonorReg" method="post">
					          <div class="form-group">
					            <label class="control-label col-sm-2" for="name">Name:</label>
					            <div class="col-sm-8">
					              <input type="text" class="form-control" id="donorName" name="donorName" placeholder="Enter Name">
					            </div>
					          </div>
					           <div class="form-group">
								  <label class="control-label col-sm-2"  for="donorGroup">Select Blood Type</label>
								  <div class="col-sm-8">
								  <select class="form-control" id="donorGroup" name="donorGroup">
								    <option value="A+ve">A+ve</option>
								    <option value="A-ve">A-ve</option>
								    <option value="B+ve">B+ve</option>
								    <option value="B-ve">B-ve</option>
								    <option value="O+ve">O+ve</option>
								    <option value="O-ve">O-ve</option>
								    <option value="AB+ve">AB+ve</option>
								    <option value="AB-ve">AB-ve</option>
								  </select>
								  </div>
								</div>
					          <div class="form-group">
					            <label class="control-label col-sm-2" for="email">Email:</label>
					            <div class="col-sm-8">
					              <input type="email" class="form-control" id="email" placeholder="Enter email">
					            </div>
					          </div>
					          <div class="form-group">
					            <label class="control-label col-sm-2" for="contact">Contact No.:</label>
					            <div class="col-sm-8">
					              <input type="number" class="form-control" id="contact" name="contact" placeholder="Enter Phone number">
					            </div>
					          </div>
					          <div class="form-group">
					            <label class="control-label col-sm-2" for="address">Address:</label>
					            <div class="col-sm-8">          
					              <textarea class="form-control" id="address" name="address" placeholder="Enter Address"></textarea> 
					            </div>
					          </div>
					          
					          <div class="form-group">        
					            <div class="col-sm-offset-4 col-sm-4">
					             <br>
					             <br>
					              <button type="submit" class=" btn btn-default">Submit</button>
					            </div>
					          </div>
					        </form>

                        
                    </div>
                </div>
                
                <HR>
                <div class="row">


	
	            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
	                <a class="thumbnail" href="#">
	                    <img class="img-responsive" src="images/1.jpg" alt="">
	                </a>
	            </div>
	            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
	                <a class="thumbnail" href="#">
	                    <img class="img-responsive" src="images/2.jpg" alt="">
	                </a>
	            </div>
	            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
	                <a class="thumbnail" href="#">
	                    <img class="img-responsive" src="images/3.jpg" alt="">
	                </a>
	            </div>
	            
	            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
	                <a class="thumbnail" href="#">
	                    <img class="img-responsive" src="images/4.jpg" alt="">
	                </a>
	            </div>
	            </div>
        </div>
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
