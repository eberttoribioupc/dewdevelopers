<%@page import="com.upc.condominio.negocio.GestionEspacioComun,com.upc.condominio.negocio.GestionReserva,
				com.upc.condominio.modelo.EspacioComun,com.upc.condominio.modelo.Horario,com.upc.condominio.exceptions.DAOExcepcion,java.util.*" %>


<html>
  
  <head>
    <title>Reserva Espacio comun</title>    
  <meta name="viewport" content="width=device-width">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <style type="text/css">
      body {
        padding-bottom: 20px;
      }
    </style>
    <script language="javascript" src="../js/ajax.js"></script>
    <script type="text/javascript">
    
   
    </script>
  </head>
  
  <body>
  <div><%@ include file="header.jsp" %></div>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h3>RESERVA DE ESPACIOS COMUNES DEL CONDOMINIO</h3>
        <p></p>
      </div>
    </div>
    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-lg-0">
          <form method="post" Action="../ReservaServlet">
            <div class="col-md-4" >Fecha:<input id="fc_fechaReserva" type="date"  class="form-control" name="fc_fechaReserva" placeholder="dd/mm/yyyy" required="required"
            onchange="validarFechaMenorActual(this.value);"
            onchange="listarHorarioDisponible('listarHorarios.jsp','&fecha='+this.value,'&ec='+document.getElementById('fc_espacioComun').value,'div_resultado')">
            </div>
            <div class="col-md-8">Espacio:
              <select class="form-control" id="fc_espacioComun" name="fc_espacioComun" required="required"
              onchange="listarHorarioDisponible('listarHorarios.jsp','&ec='+this.value,'&fecha='+document.getElementById('fc_fechaReserva').value,'div_resultado')">
				<option></option>
						<% 
						  GestionEspacioComun negocio = new GestionEspacioComun();
							try {
								Collection<EspacioComun> listado = negocio.listarEspacios();
								
								for (EspacioComun m : listado) {%>
									 <option value="<%=m.getIdespacio()%>"><%=m.getNombreEspacio()%></option>
								<%} 
							} catch (DAOExcepcion e) {
						      out.print("Fall� el Listado: "+e.getMessage());
						    } 
						 %>
              </select>
            <INPUT type="hidden" name="idResidente" value="<%=request.getParameter("idResidente") %>">
            </div>
            <table class="table">
              <thead>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <th>N&ordm;</th>
                  <th>HORARIOS DISPONIBLES</th>
                </tr>
              </thead>
              <tbody id="div_resultado">
                <tr >
                  <td></td>
                </tr>  
              </tbody>
            </table>
            <div>
            <%
            String vt=null;
            String vf=null;
            
            String aux = request.getParameter("aux");
            if(aux != null && aux.equals("y")){%>
            		  <p></p>
			          <div class="alert alert-success">
			            <button type="button" class="close" data-dismiss="alert">&times;</button>
			            <b>En hora buena,</b> Su reserva se registr� con �xito.
			          </div>
            	
            <%}else if(aux != null && aux.equals("n")){%>
			          <p></p>
			          <div class="alert alert-danger">
			            <button type="button" class="close" data-dismiss="alert">&times;</button>
			            <b>ERROR!</b> Usted ha superado las posibles reservas del espacio seleccionado por d�a.
			          </div>
            		
            	<%}%>
           </div>
           <p>
            <div class="col-md-4">
              <input type="submit" value="ENVIAR">
            </div>
            
          </form>
        </div>
        <div class="col-lg-4">
        
          <p></p>
        </div>
      </div>
      <hr>
      <footer>
        <p>&copy; Developers 2013</p>
        <nav>
          <div class="container"></div>
        </nav>
      </footer>
    </div>
    <!-- /container -->
  </body>

</html>