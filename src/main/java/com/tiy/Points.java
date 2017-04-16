package com.tiy;

import javax.lang.model.type.IntersectionType;

/**
 * Created by josh on 4/16/17.
 */
public class Points {
	private Integer playerId;
	private Integer points;

	public Points(){}

	public Points(Integer playerId, Integer points){
		this.playerId = playerId;
		this.points = points;
	}

	public Integer getPlayerId() {
		return playerId;
	}

	public void setPlayerId(Integer playerId) {
		this.playerId = playerId;
	}

	public Integer getPoints() {
		return points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

	public void addPoints(Integer amount){
		this.points += amount;
	}

	public void removePoints(Integer amount){
		Integer newAmount = points - amount;
		if(newAmount >=0){
			this.points = newAmount;
		}else{
			this.points = 0;
		}
	}

	public boolean isOutOfPoints(){
		boolean isOut = false;
		if(this.points <= 0){

		}else{
			isOut = true;
		}
		return isOut;
	}
}
