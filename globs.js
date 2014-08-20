var siteloc = "http://localhost/Restuarant_menu";
var scriptloc = "/scripts/"

function fetchmenu(menu_id)
{
  $.ajax({
      url: siteloc + scriptloc + "menu.py",
      data: {menu_id:menu_id,
             },
      dataType: 'json',
      success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
					  table = '<table border="1">';
					  for (i = 0; i < res.length; i++)
					  {
						  row = res[i];
						  table += "<tr>";
						  for (j = 0; j < row.length; j++)
						  {
							  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
              }
    });
}