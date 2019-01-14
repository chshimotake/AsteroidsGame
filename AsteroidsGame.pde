//your variable declarations here
Spaceship ship;
Leftwing lWing;
Rightwing rWing;
Leftbackwing lbWing;
Rightbackwing rbWing;
PImage img;
PImage end1;
PImage end2;
PImage end3;
PImage end4;
PImage end5;
PImage end6;
PImage end7;
PImage end8;
PImage end9;
PImage tieBoom;
PImage boomwait;
PImage telewait;
PImage timewait;
PImage crosswait;
int count=0, tCount=0, bCount=0, dCount=0, cCount=0, eCount=0;
int turn=0, endX=0, endY=0, dedPer=0, bolAstX=0, bolAstY=0;
int blastWait=900, chroWait=600, telWait=300, plusWait=300, invfill=0;
int tSize=45, bX=5, bY=50;
boolean tele = false;
boolean boom = false;
boolean tStop = false;
boolean endGame = false;
boolean blast = false;
boolean bolCross = false;
boolean invinc = false;
int teleX, teleY;
color rd=color(255,0,0);
color og=color(255,127,0);
color yw=color(255,255,0);
color gn=color(0,255,0);
color bu=color(0,0,255);
color pe=color(139,0,255);
ArrayList<Bolt> bolt = new ArrayList<Bolt>();
ArrayList<Double> tStopX = new ArrayList<Double>();
ArrayList<Double> tStopY = new ArrayList<Double>();
ArrayList<Integer> tieBlastX = new ArrayList<Integer>();
ArrayList<Integer> tieBlastY = new ArrayList<Integer>();
Star[] stars=new Star[500];
ArrayList<Asteroid> rockBottom = new ArrayList<Asteroid>();
public void setup() 
{
	ship=new Spaceship();
	lWing=new Leftwing();
	rWing=new Rightwing();
	lbWing=new Leftbackwing();
	rbWing=new Rightbackwing();
	ship.setX(500);
	ship.setY(500);
	lWing.setX(500);
	lWing.setY(500);
	rWing.setX(500);
	rWing.setY(500);
	lbWing.setX(500);
	lbWing.setY(500);
	rbWing.setX(500);
	rbWing.setY(500);
	size(1000, 1000);

	background(0, 0, 0);
	noStroke();
	for(int i=0; i<stars.length;i++)
  	{
  		stars[i]=new Star();
  	}
  	for(int h=0;  h<5; h++)
  	{
  		rockBottom.add(new Asteroid());
  		if(rockBottom.get(rockBottom.size()-1).cloDet(ship.getX(), ship.getY()))
		{
			rockBottom.remove(rockBottom.size()-1);
		}
  	}
  	img=loadImage("flashtele.png");
  	end1=loadImage("explofr1.gif");
  	end2=loadImage("explofr2.gif");
  	end3=loadImage("explofr3.gif");
  	end4=loadImage("explofr4.gif");
  	end5=loadImage("explofr5.gif");
  	end6=loadImage("explofr6.gif");
  	end7=loadImage("explofr7.gif");
  	end8=loadImage("explofr8.gif");
  	end9=loadImage("explofr9.gif");
  	tieBoom=loadImage("explosion.png");
  	boomwait=loadImage("boomwait.png");
  	telewait=loadImage("telewait.png");
  	timewait=loadImage("timewait.png");
  	crosswait=loadImage("crosswait.png");
}
public void show()
{
	for(int i=0; i<stars.length;i++)
  	{
  		stars[i].show();
  	}
  	//makes stars
  	ship.show();
  	lWing.show();
  	rWing.show();
  	lbWing.show();
  	rbWing.show();
  	//shows the ship
  	for(int g=0; g<rockBottom.size();g++)
  	{
  		rockBottom.get(g).show();
  	}
  	//shows the tie fighter asteroid
  	for(int e=0; e<bolt.size();e++)
  	{
  		bolt.get(e).show();
  	}
  	//shows the bolts
  	noStroke();
  	fill(255,255,255);
  	rect(70, 5, 60, chroWait/10);
  	image(timewait, 70, 5, 60, 60);
  	rect(135, 5, 60, telWait/5);
  	image(telewait, 135, 5, 60, 60);
  	rect(200, 5, 60, plusWait/5);
  	image(crosswait, 200, 5, 60, 60);
  	rect(5,5,60,blastWait/15);
  	image(boomwait,5,5,60,60);
  	arc(965, 35, 60, 60, 0, radians(3.6*invfill), PIE);
}
public void draw() 
{
	fill(0,0,0);
	rect(0, 0, 1000, 1000);
	//makes background
  	if(tCount==20&&tStop)
	{
		tStop=false;
		tiStart();
	}else if(tStop)
	{
		tCount++;
	}
	//frame counter for the time stop button
  	for(int g=0; g<rockBottom.size();g++)
  	{
  		rockBottom.get(g).move();
  	}
  	//moves all tie fighter asteroids
	ship.move();
	lWing.move();
	rWing.move();
	lbWing.move();
	rbWing.move();
	//moves the ship
	for(int f=0; f<rockBottom.size();f++)
  	{
  		if(ship.distDet(rockBottom.get(f).getX(),rockBottom.get(f).getY())&&invinc==false)
  		{
  			rockBottom.remove(f);
  			endX=ship.getX();
			endY=ship.getY();
  			ship.setX(0);
  			ship.setY(0);
  			lWing.setX(0);
  			lWing.setY(0);
  			lWing.setX(0);
  			lWing.setY(0);
  			rWing.setX(0);
  			rWing.setY(0);
  			lbWing.setX(0);
  			lbWing.setY(0);
  			rbWing.setX(0);
  			rbWing.setY(0);
  			ship.setTagX(0);
  			ship.setTagY(0);
  			ship.setBombX(0);
  			ship.setBombY(0);
  			ship.setDirectionX(0);
        	ship.setDirectionY(0);
        	lWing.setDirectionX(0);
        	lWing.setDirectionY(0);
        	rWing.setDirectionX(0);
        	rWing.setDirectionY(0);
        	lbWing.setDirectionX(0);
        	lbWing.setDirectionY(0);
        	rbWing.setDirectionX(0);
        	rbWing.setDirectionY(0);
        	ship.myColor=color(0,0,0);
        	lWing.myColor=color(0,0,0);
        	rWing.myColor=color(0,0,0);
        	lbWing.myColor=color(0,0,0);
        	rbWing.myColor=color(0,0,0);
  			endGame=true;
		}
  	}
  	//ship to asteroid impact detector
	for(int e=0; e<bolt.size();e++)
  	{
  		bolt.get(e).move();
  	}
  	//moves the bolts
  	for(int e=0; e<bolt.size();e++)
  	{
  		if(bolt.get(e).myCenterX>1000||bolt.get(e).myCenterX<0||bolt.get(e).myCenterY>1000||bolt.get(e).myCenterY<0)
    	{
    		bolt.remove(e);
    	}
  	}
  	//removes the bolts
  	boAst();
  	//bolt to asteroid impact detection
	if(count<5&&tele)
	{
		flashDis();
		if(count==4)
		{
			tele=false;
		}
	}
	if(tele)
	{
		count++;
	}
	//frame counter for teleportation image
	
	if(eCount<201&&endGame)
	{
		if(eCount<10)
		{
			image(end1, endX-150,endY-150, 300, 300);
		}
		if(eCount>9&&eCount<20)
		{
			image(end2, endX-150,endY-150, 300, 300);
		}
		if(eCount>19&&eCount<30)
		{
			image(end3, endX-150,endY-150, 300, 300);
		}
		if(eCount>29&&eCount<40)
		{
			image(end4, endX-150,endY-150, 300, 300);
		}
		if(eCount>39&&eCount<50)
		{	
			image(end5, endX-150,endY-150, 300, 300);
		}
		if(eCount>49&&eCount<60)
		{
			image(end6, endX-150,endY-150, 300, 300);
		}
		if(eCount>59&&eCount<70)
		{
			image(end7, endX-150,endY-150, 300, 300);
		}
		if(eCount>69&&eCount<80)
		{
			image(end8, endX-150,endY-150, 300, 300);
		}
		if(eCount>79&&eCount<90)
		{
			image(end9, endX-150,endY-150, 300, 300);
		}
		if(eCount==200)
		{
			endGame=false;
			exit();
		}
		if(endGame)
		{
			eCount++;
		}
	}
	//ship explosion counter at the end of the game
	
	if(dCount<31&&blast)
	{
		boAst();
		image(tieBoom, bolAstX, bolAstY, 50, 50);
		if(dCount==30)
		{
			blast=false;
			dCount=0;
		}
		if(blast)
		{
			dCount++;
		}
	}

	if(bCount<51&&boom)
	{
		if(bCount==50)
		{
			boom=false;
			bCount=0;
			tieBlastX.clear();
			tieBlastY.clear();
		}
	}
	if(boom)
	{
		fill(255,255,255);
		ellipse(ship.getBombX(), ship.getBombY(), bCount*50, bCount*50);
		fill(0,0,0);
		ellipse(ship.getBombX(), ship.getBombY(), (bCount*35), (bCount*35));
		for(int z=0;z<rockBottom.size();z++)
		{
			if(rockBottom.get(z).bomDet(ship.getBombX(), ship.getBombY(), bCount*35))
			{
				tieBlastX.add(rockBottom.get(z).getX());

				tieBlastY.add(rockBottom.get(z).getY());
				rockBottom.remove(z);
				if(invfill<101)
				{
					invfill++;
				}
				break;
			}
		}
		boomDis();
		bCount++;
	}
	//pulse bomb impact detection
	if(invinc)
	{
		if(invfill>0)
		{
			invfill-=0.6;
			invShipFlash(invfill);
		}
		if(invfill==0&&endGame==false)
		{
			invinc=false;
			ship.myColor=color(211,211,211);
			lWing.myColor=color(255,0,0);
			rWing.myColor=color(255,0,0);
			lbWing.myColor=color(255,0,0);
			rbWing.myColor=color(255,0,0);
		}
	}
	if(cCount<3600&&bolCross)
	{
		if(cCount==40)
		{
			bolCross=false;
			cCount=0;
		}
		if(bolCross)
		{
			bolt.add(new Bolt());
			bolt.get(bolt.size()-1).setDirectionX(25);
			bolt.get(bolt.size()-1).setDirectionY(0);
			bolt.get(bolt.size()-1).setPointDirection(0);
			bolt.add(new Bolt());
			bolt.get(bolt.size()-1).setDirectionX(0);
			bolt.get(bolt.size()-1).setDirectionY(-25);
			bolt.get(bolt.size()-1).setPointDirection(90);
			bolt.add(new Bolt());
			bolt.get(bolt.size()-1).setDirectionX(-25);
			bolt.get(bolt.size()-1).setDirectionY(0);
			bolt.get(bolt.size()-1).setPointDirection(180);
			bolt.add(new Bolt());
			bolt.get(bolt.size()-1).setDirectionX(0);
			bolt.get(bolt.size()-1).setDirectionY(25);
			bolt.get(bolt.size()-1).setPointDirection(270);
			cCount++;
		}
	}
	if(turn%100==0)
	{
		rockBottom.add(new Asteroid());
		if(rockBottom.get(rockBottom.size()-1).cloDet(ship.getX(), ship.getY()))
		{
			rockBottom.remove(rockBottom.size()-1);
		}
	}
	turn++;
	//adds a new asteroid every 100 frames
	if(blastWait<900)
	{
		blastWait++;
	}
	if(chroWait<600)
	{
		chroWait++;
	}
	if(telWait<300)
	{
		telWait++;
	}
	if(plusWait<300)
	{
		plusWait++;
	}
	//determines recharge time
	show();
}
public void keyPressed()
{
	switch (key) {
		case 'w':
			ship.accelerate(1);
			lWing.accelerate(1);
			rWing.accelerate(1);
			lbWing.accelerate(1);
			rbWing.accelerate(1);
		break;
		case 'a':
			ship.turn(-10);
			lWing.turn(-10);
			rWing.turn(-10);
			lbWing.turn(-10);
			rbWing.turn(-10);
		break;
		case 's':
			ship.accelerate(-1);
			lWing.accelerate(-1);
			rWing.accelerate(-1);
			lbWing.accelerate(-1);
			rbWing.accelerate(-1);
		break;
		case 'd':
			ship.turn(10);
			lWing.turn(10);
			rWing.turn(10);
			lbWing.turn(10);
			rbWing.turn(10);
		break;
		case 'z':
			ship.setTagX(ship.getX());
			ship.setTagY(ship.getY());
		break;
		case 'x':
			if(ship.getTagX()==0)
			{
				ship.setTagX(ship.getX());
			}
			if(ship.getTagY()==0)
			{
				ship.setTagY(ship.getY());
			}
			if(invinc==false)
			{
				if(telWait==300)
			{
				tele=true;
				count=0;
				image(img, ship.getX()-140, ship.getY()-106, 280, 212);
				teleX=ship.getX();
				teleY=ship.getY();
				ship.setX(ship.getTagX());
				ship.setY(ship.getTagY());
				lWing.setX(ship.getTagX());
				lWing.setY(ship.getTagY());
				rWing.setX(ship.getTagX());
				rWing.setY(ship.getTagY());
				lbWing.setX(ship.getTagX());
				lbWing.setY(ship.getTagY());
				rbWing.setX(ship.getTagX());
				rbWing.setY(ship.getTagY());
				dedPer=(int)(Math.random()*10);
				if(dedPer!=4)
				{
					image(img, ship.getTagX()-140, ship.getTagY()-106, 280, 212);
				}else if(dedPer==4){
					endX=ship.getX();
	  				endY=ship.getY();
		  			ship.setX(0);
		  			ship.setY(0);
		  			lWing.setX(0);
		  			lWing.setY(0);
		  			lWing.setX(0);
		  			lWing.setY(0);
		  			rWing.setX(0);
		  			rWing.setY(0);
		  			lbWing.setX(0);
		  			lbWing.setY(0);
		  			rbWing.setX(0);
		  			rbWing.setY(0);
		  			ship.setTagX(0);
		  			ship.setTagY(0);
		  			ship.setBombX(0);
		  			ship.setBombY(0);
		  			ship.setDirectionX(0);
	            	ship.setDirectionY(0);
	            	lWing.setDirectionX(0);
	            	lWing.setDirectionY(0);
	            	rWing.setDirectionX(0);
	            	rWing.setDirectionY(0);
	            	lbWing.setDirectionX(0);
	            	lbWing.setDirectionY(0);
	            	rbWing.setDirectionX(0);
	            	rbWing.setDirectionY(0);
	            	ship.myColor=color(0,0,0);
	            	lWing.myColor=color(0,0,0);
	            	rWing.myColor=color(0,0,0);
	            	lbWing.myColor=color(0,0,0);
	            	rbWing.myColor=color(0,0,0);
		  			endGame=true;
				}
			}else if(invinc==true)
			{
				if(telWait==60)
			{
				tele=true;
				count=0;
				image(img, ship.getX()-140, ship.getY()-106, 280, 212);
				teleX=ship.getX();
				teleY=ship.getY();
				ship.setX(ship.getTagX());
				ship.setY(ship.getTagY());
				lWing.setX(ship.getTagX());
				lWing.setY(ship.getTagY());
				rWing.setX(ship.getTagX());
				rWing.setY(ship.getTagY());
				lbWing.setX(ship.getTagX());
				lbWing.setY(ship.getTagY());
				rbWing.setX(ship.getTagX());
				rbWing.setY(ship.getTagY());
				dedPer=(int)(Math.random()*10);
				if(dedPer!=4)
				{
					image(img, ship.getTagX()-140, ship.getTagY()-106, 280, 212);
				}else if(dedPer==4){
					endX=ship.getX();
	  				endY=ship.getY();
		  			ship.setX(0);
		  			ship.setY(0);
		  			lWing.setX(0);
		  			lWing.setY(0);
		  			lWing.setX(0);
		  			lWing.setY(0);
		  			rWing.setX(0);
		  			rWing.setY(0);
		  			lbWing.setX(0);
		  			lbWing.setY(0);
		  			rbWing.setX(0);
		  			rbWing.setY(0);
		  			ship.setTagX(0);
		  			ship.setTagY(0);
		  			ship.setBombX(0);
		  			ship.setBombY(0);
		  			ship.setDirectionX(0);
	            	ship.setDirectionY(0);
	            	lWing.setDirectionX(0);
	            	lWing.setDirectionY(0);
	            	rWing.setDirectionX(0);
	            	rWing.setDirectionY(0);
	            	lbWing.setDirectionX(0);
	            	lbWing.setDirectionY(0);
	            	rbWing.setDirectionX(0);
	            	rbWing.setDirectionY(0);
	            	ship.myColor=color(0,0,0);
	            	lWing.myColor=color(0,0,0);
	            	rWing.myColor=color(0,0,0);
	            	lbWing.myColor=color(0,0,0);
	            	rbWing.myColor=color(0,0,0);
		  			endGame=true;
				}
			}
			
				telWait=0;
			}
		case 'f':
			ship.setDirectionX(0);
			ship.setDirectionY(0);
			lWing.setDirectionX(0);
	        lWing.setDirectionY(0);
	        rWing.setDirectionX(0);
	        rWing.setDirectionY(0);
	        lbWing.setDirectionX(0);
	        lbWing.setDirectionY(0);
	        rbWing.setDirectionX(0);
	        rbWing.setDirectionY(0);
		break;
		case 'c':
			if(invinc==false)
			{
				if(plusWait==300)
				{
					bolCross=true;
					plusWait=0;
				}
			}else if(invinc==true)
			{ 
				if(plusWait==300)
				{
					bolCross=true;
					plusWait=0;
				}
			}
		case ' ':
			bolt.add(new Bolt());
			/*bolt.setX(ship.getX());
			bolt.setY(ship.getY());
			bolt.setPointDirection((int)ship.myPointDirection);
			bolt.accelerate(2);*/
		break;
		case 'e':
			if(chroWait==600)
			{
				tStop=true;
				tCount=0;
				tStopX.clear();
				tStopY.clear();
				for(int f=0;f<rockBottom.size();f++)
				{
					tStopX.add(rockBottom.get(f).getDirectionX());
					tStopY.add(rockBottom.get(f).getDirectionY());
				}
				tStop=true;
				tCount=0;
				tiStop();
				chroWait=0;
			}
		break;
		case 'q':
			if(blastWait==900)
			{
				boom=true;
				ship.setBombX(ship.getX());
				ship.setBombY(ship.getY());
				blastWait=0;
			}
		break;
		case 'r':
			endX=ship.getX();
			endY=ship.getY();
  			ship.setX(0);
  			ship.setY(0);
  			lWing.setX(0);
  			lWing.setY(0);
  			lWing.setX(0);
  			lWing.setY(0);
  			rWing.setX(0);
  			rWing.setY(0);
  			lbWing.setX(0);
  			lbWing.setY(0);
  			rbWing.setX(0);
  			rbWing.setY(0);
  			ship.setTagX(0);
  			ship.setTagY(0);
  			ship.setBombX(0);
  			ship.setBombY(0);
  			ship.setDirectionX(0);
        	ship.setDirectionY(0);
        	lWing.setDirectionX(0);
        	lWing.setDirectionY(0);
        	rWing.setDirectionX(0);
        	rWing.setDirectionY(0);
        	lbWing.setDirectionX(0);
        	lbWing.setDirectionY(0);
        	rbWing.setDirectionX(0);
        	rbWing.setDirectionY(0);
        	ship.myColor=color(0,0,0);
        	lWing.myColor=color(0,0,0);
        	rWing.myColor=color(0,0,0);
        	lbWing.myColor=color(0,0,0);
        	rbWing.myColor=color(0,0,0);
  			endGame=true;
  		break;
  		case 'v':
  			invinc=true;
  		break;
  		case 'b':
  			invfill+=30;
  		break;
	}
}
public void tiStop()
{
	for(int e=0;e<rockBottom.size();e++)
	{
		rockBottom.get(e).setDirectionX(0);
		rockBottom.get(e).setDirectionY(0);
	}
}
public void tiStart()
{
	for(int d=0;d<rockBottom.size()-1;d++)
	{
		rockBottom.get(d).setDirectionX(tStopX.get(d));
		rockBottom.get(d).setDirectionY(tStopY.get(d));
	}
}
public void flashDis()
{
	image(img, teleX-140, teleY-106, 280, 212);
	if(dedPer!=4)
	{
		image(img, ship.getTagX()-140, ship.getTagY()-106, 280, 212);
	}
}
public void boomDis()
{
	for(int y=0;y<tieBlastY.size();y++)
	{
		image(tieBoom, tieBlastX.get(y), tieBlastY.get(y), 50, 50);
	}
}
	/*start working with the explogif. each frame of the gif 
	plays every 0.01 seconds and the framerate of this 
	program is 60 frames per second*/
public void boAst()
{
	for(int c=0; c<rockBottom.size();c++)
  	{
  		for(int b=0; b<bolt.size();b++)
  		{
  			if(rockBottom.get(c).cloDet(bolt.get(b).getX(),bolt.get(b).getY()))
  			{
  				bolAstX=rockBottom.get(c).getX();
  				bolAstY=rockBottom.get(c).getY();
  				image(tieBoom, bolAstX, bolAstY, 50, 50);
  				rockBottom.remove(c);
  				blast=true;
  				if(invfill<101)
  				{
  					invfill++;
  				}
  				if(tStopX.size()!=0)
  				{
  					tStopX.remove(c-5);
  					tStopY.remove(c-5);
  				}
  				break;
  			}
  		}
  	}
}
public void invShipFlash(int i)
{
	switch(i%10) {
		case 0:
			ship.myColor=rd;
			lWing.myColor=og;
			rWing.myColor=yw;
			lbWing.myColor=gn;
			rbWing.myColor=bu;
		break;
		case 1:
			ship.myColor=pe;
			lWing.myColor=rd;
			rWing.myColor=og;
			lbWing.myColor=yw;
			rbWing.myColor=gn;
		break;
		case 2:
			ship.myColor=bu;
			lWing.myColor=pe;
			rWing.myColor=rd;
			lbWing.myColor=og;
			rbWing.myColor=yw;
		break;
		case 3:
			ship.myColor=gn;
			lWing.myColor=bu;
			rWing.myColor=pe;
			lbWing.myColor=rd;
			rbWing.myColor=og;
		break;
		case 4:
			ship.myColor=yw;
			lWing.myColor=gn;
			rWing.myColor=bu;
			lbWing.myColor=pe;
			rbWing.myColor=rd;
		break;
		case 5:
			ship.myColor=og;
			lWing.myColor=yw;
			rWing.myColor=gn;
			lbWing.myColor=bu;
			rbWing.myColor=pe;
		break;
		case 6:
			ship.myColor=rd;
			lWing.myColor=og;
			rWing.myColor=yw;
			lbWing.myColor=gn;
			rbWing.myColor=bu;
		break;
		case 7:
			ship.myColor=pe;
			lWing.myColor=rd;
			rWing.myColor=og;
			lbWing.myColor=yw;
			rbWing.myColor=gn;
		break;
		case 8:
			ship.myColor=bu;
			lWing.myColor=pe;
			rWing.myColor=rd;
			lbWing.myColor=og;
			rbWing.myColor=yw;
		break;
		case 9:
			ship.myColor=gn;
			lWing.myColor=bu;
			rWing.myColor=pe;
			lbWing.myColor=rd;
			rbWing.myColor=og;
		break;
	}
}