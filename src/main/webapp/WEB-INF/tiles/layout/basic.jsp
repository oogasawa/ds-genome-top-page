<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
  <head>
    <title>DS Text Search</title>

    <style>
      table tr:hover {
        background-color: #FFCC99;  /* mouse over */
      }
    </style>

	</head>
	<body>
		<!-- Header -->
		<tiles:insertAttribute name="header" />
		<!-- Body -->
		<tiles:insertAttribute name="body" />
		<!-- Footer -->
		<tiles:insertAttribute name="footer" />
	</body>
</html>