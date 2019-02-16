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

</head>

<body>

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
                    <a href="contact.jsp">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <br>
                    <div class="col-lg-6 col-lg-offset-2 text-center" >
                        <h1>Donor Search</h1>                        
                        <br>
                        <form class="form-horizontal" role="form" method="post">
					          <div class="form-group">
								  <label  class="control-label col-sm-3"  for="donorGroup">Select Blood Type</label>
								  <div class="col-sm-8">
								  <select class="form-control" id="donorGroup">
								  	<option>--</option>
								    <option>A+ve</option>
								    <option>A-ve</option>
								    <option>B+ve</option>
								    <option>B-ve</option>
								    <option>O+ve</option>
								    <option>O-ve</option>
								    <option>AB+ve</option>
								    <option>AB-ve</option>
								  </select>
								  </div>
								</div>
						</form>
						
                    </div>
                </div>
                <div class="row">
                	<div id="donortable" class="col-lg-8 col-lg-offset-2">
                	 </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Modal Header</h4>
	      </div>
	      <div class="modal-body">
	       <div class="row">
            <div class="col-md-8">
                <h3>Send us a Message</h3>
                <form name="sentMessage" id="" novalidate>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Full Name:</label>
                            <input type="text" class="form-control" id="name" >
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Phone Number:</label>
                            <input type="tel" class="form-control" id="phone">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Email Address:</label>
                            <input type="email" class="form-control" id="email">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Message:</label>
                            <textarea rows="10" cols="100" class="form-control" id="message"></textarea>
                        </div>
                    </div>
                   
                </form>
            </div>

        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Send Message</button>
	      </div>
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
	  $(document).ready(function (ev1) {
	  $('#myModal').on('hidden.bs.modal', function (e) {
		  alert("Message was Sent");
		});
		
		$('#myModal').on('shown.bs.modal', function () {
	  	$('#myInput').focus()
		});
	
	
	//ajax call to get donors
	  $("#donorGroup").on('change',function (ev2) {
	
	    var group = $("select#donorGroup option:selected").val();
	    $.ajax({
	      type: "POST",
	      url: 'donordata.jsp',
	      data: {bloodgroup: group},
	      success: function (result) {
	        debugger;
	        $("#donortable").html(result);
	      },
	      error: function (e) {
	        alert('Error');
	      }
	    })
	  })
	});
	
	
	
    </script>

</body>

</html>
