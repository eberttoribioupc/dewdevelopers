package com.upc.condominio.test;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;

import junit.framework.Assert;

import org.junit.Test;

import com.upc.condominio.exceptions.DAOExcepcion;
import com.upc.condominio.modelo.Horario;
import com.upc.condominio.modelo.Mensaje;
import com.upc.condominio.modelo.Reserva;
import com.upc.condominio.negocio.GestionMensaje;
import com.upc.condominio.negocio.GestionReserva;

public class GestionReservaTest {
	Date fecha = new Date(System.currentTimeMillis());
	
	//@Test
	public void insertarReservaTest(){
		
		GestionReserva negocio = new GestionReserva();
		
		try {
			negocio.insertar(fecha,3,2,1);
			
		} catch (DAOExcepcion e) {
			Assert.fail("No se pudo insertar el registro: "+e.getMessage());
		}
		
	}

	@Test
	public void ListarFechasDisponibles(){
		
		GestionReserva negocio = new GestionReserva();
		/*DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            
		Date fecha1 = df.parse("2013-11-11");*/
		try {
			Collection<Horario> listado = negocio.listarHorariosDisponibles(fecha,3);
			
			System.out.println("HORARIOS DISPONIBLES");
			System.out.println("---------------------------------------------------------------------------------------------------");
			
			for (Horario h : listado) {
				System.out.println(h.getIdHorario());
				System.out.println(h.getRango());
			}
			Assert.assertTrue(listado.size()>0);
		} catch (DAOExcepcion e) {
			
			Assert.fail("Fall� el Listado: "+e.getMessage());
		}
	}
}