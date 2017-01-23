class AmmoPowerup extends GameObject implements Powerup // Because it implements the interface it must include the applyTo method
{
  float theta;
  AmmoPowerup()
  {
    theta = 0;
    forward = new PVector(random(-1, 1), random(-1, 1));
    forward.normalize();
  }
  
  void applyTo(Player p)
  {
    p.ammo ++;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    rotate(theta);
    stroke(255, 255, 0);
    rectMode(CENTER);
    rect(0, 0, 30, 30);
    popMatrix();
  }
  
  void update()
  {
    theta += 0.1f;
    pos.add(forward);
  }
}