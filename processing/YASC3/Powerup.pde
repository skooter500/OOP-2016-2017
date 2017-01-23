// An interface is like a class where all the methods are abstract
// It is used to implement a concept called design by contract
// If a class implements this interface, then it MUST implement the applyTo method
interface Powerup
{
  void applyTo(Player p);
}