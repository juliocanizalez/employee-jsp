const fetchDepartment = () => {
  const departmentId = $('#department').val()

  $.ajax({
    type: "POST",
    url: "components/fetchDepartment.jsp",
    data: `departmentId=${departmentId}`,
    cache: false,
    success: response => {
      $("#data").html(response)
    }
  })
}