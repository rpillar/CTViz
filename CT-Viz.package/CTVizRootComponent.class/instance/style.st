hooks
style 
	^ '
body {
	padding: 0;
 	margin: 0;
	font-family: Catamaran;
}
table {
    margin: 0 auto;
    width: 100%;
    clear: both;
    border-collapse: collapse;
    table-layout: fixed;
    word-wrap:break-word;
  }
  table tr {
    line-height: 1.25;
  }
  table tr th {
    font-size: 1.3em;
    cursor: pointer;
    outline: none;
  }
  td {
    font-size: 1.2rem;
    padding:10px 5px;
    font-weight: 600;
  }
  	td.details-control {
		background: url(''https://raw.githubusercontent.com/DataTables/DataTables/1.10.7/examples/resources/details_open.png'') no-repeat center center;
    	cursor: pointer;
	}  
	tr.shown td.details-control {
    	background: url(''https://raw.githubusercontent.com/DataTables/DataTables/1.10.7/examples/resources/details_close.png'') no-repeat center center;
  }
  .dataTables_length {
    display: none;
  }
  .dataTables_filter label {
    font-weight: 600;
  }
  .dataTables_wrapper .dataTables_info {
    margin-bottom: 10px;
    float: right;
  }
  .dataTables_wrapper .dataTables_paginate {  
    float: left;
  }
  #summary-table_paginate a.paginate_button {
    text-decoration: none;
    background-color: #26a69a;
    color: #fff;
    border: none;
    border-radius: 5px;
    height: 36px;
    line-height: 36px;
    padding: 2px 12px;
    text-transform: uppercase;
    margin: 10px 5px;
    cursor: pointer;
  }  
  a.paginate_button .previous {
    color: white; 
  }

'	