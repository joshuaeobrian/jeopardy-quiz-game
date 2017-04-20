package com.tiy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 * Created by josh on 4/16/17.
 */
@Component
public class PlayerRepository {
	@Autowired
	JdbcTemplate template;


	public Player getPlayer(Integer playerId){
		return template.queryForObject("SELECT player.id as id, player.firstname as fname,player.lastname as lname," +
						" player.username as uname,player.password as password, c.amount as amount from player as player " +
						"JOIN currency as c on player.id = c.player_id WHERE player.id = ?",new Object[]{playerId},
				(rs,i)-> new Player(
					rs.getInt("id"),
						rs.getString("fname"),
						rs.getString("lname"),
						rs.getString("uname"),
						rs.getString("password"),
						new Points(
								rs.getInt("id"),
								rs.getInt("amount")
						)
				));
	}

	public void updatePoints(Player player) {
//		Integer current =
		template.update("UPDATE currency SET amount=? where player_id=?",
				new Object[] {player.getPoints().getPoints(),player.getId()});
	}

	public Player getPlayerBySessionId(Integer sessionId) {
		return template.queryForObject("SELECT player.id as id, player.firstname as fname,player.lastname as lname," +
						" player.username as uname,player.password as password, c.amount as amount from player as player " +
						"JOIN currency as c on player.id = c.player_id WHERE player.id =(" +
						"SELECT player_id FROM game_session WHERE id=?);"
				,new Object[]{sessionId},
				(rs,i)-> new Player(
						rs.getInt("id"),
						rs.getString("fname"),
						rs.getString("lname"),
						rs.getString("uname"),
						rs.getString("password"),
						new Points(
								rs.getInt("id"),
								rs.getInt("amount")
						)
				));
	}

	public Integer startSession(Integer playerId) {
		return template.queryForObject("INSERT INTO game_session(player_id)" +
						" VALUES(?) RETURNING id",
				new Object[]{playerId},(rs,i)-> rs.getInt("id"));
	}

	public Player getPlayerByUsernameAndPassword(String username, String password) {

		return template.queryForObject("SELECT player.id as id, player.firstname as fname,player.lastname as lname," +
						" player.username as uname,player.password as password, c.amount as amount from player as player " +
						"JOIN currency as c on player.id = c.player_id WHERE player.username = ? AND password=?",new Object[]{username, password},
				(rs,i)-> new Player(
						rs.getInt("id"),
						rs.getString("fname"),
						rs.getString("lname"),
						rs.getString("uname"),
						rs.getString("password"),
						new Points(
								rs.getInt("id"),
								rs.getInt("amount")
						)
				));
	}

	public Integer createNewPlayer(Player player){
		Integer id = template.queryForObject("INSERT INTO player(firstname, lastname, username, password) VALUES(?,?,?,?) RETURNING id",
				new Object[] {player.getFirstName(),player.getLastName(),player.getUsername(),player.getPassword()},
				(rs,i)-> rs.getInt("id"));

		template.update("INSERT INTO currency(player_id)VALUES (?)",new Object[] {id});

		return id;
	}
}
