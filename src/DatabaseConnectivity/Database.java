package DatabaseConnectivity;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.HashMap;
import java.util.HashSet;
public class Database 
{
	static Connection con;
	PreparedStatement ps;
	public static String MySQL="jdbc:mysql://localhost:3306/letusorder?serverTimezone=UTC";
	public static String MySQLDriver="com.mysql.cj.jdbc.Driver";
	static
	{
		try
		{
			Class.forName(Database.MySQLDriver);
			System.out.println("Driver has been registered");
			con=DriverManager.getConnection(Database.MySQL,"GURIQBAL","Prince@2241");
			System.out.println("Connection has been set up");
		} 
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}
	public boolean checkCredentials(String username,String password)
	{
		try
		{
			System.out.println("\nFetching database for checkCredentials...");
			ps=con.prepareStatement("select * from users where username='"+username+"' and pass='"+password+"'");
			System.out.println("Checking Credentials...");
			ResultSet rs=ps.executeQuery();
			if(rs.isBeforeFirst()) return true;
			else return false;
		}
		catch(SQLException e)
		{
			return false;
		}	
	}
	public String getName(String username)
	{
		try
		{
			System.out.println("\nFetching database for getName...");
			ps=con.prepareStatement("select name from users where username='"+username+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}
		catch(SQLException e)
		{
			return null;
		}	
	}
	public int getCartQuantity(String username)
	{
		try
		{
			System.out.println("\nFetching database for getCartQuantity...");
			ps=con.prepareStatement("select * from `"+username+"`");
			ResultSet rs=ps.executeQuery();
			int count=0;
			while(rs.next())
			{
				count++;
			}
			return count;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public void getUserDp(String username)
	{
		try
		{
			System.out.println("\nFetching database for getUserDp...");
			ps=con.prepareStatement("select DP from users where username='"+username+"'");
			ResultSet rs=ps.executeQuery();
			String filepath = "C:/Users/hp/eclipseEE/LetUsOrder/WebContent/Image/test.jpg";
			if (rs.next()) 
			{
                Blob blob = rs.getBlob("DP");
                InputStream inputStream1 = blob.getBinaryStream();
                OutputStream outputStream = new FileOutputStream(filepath);
                int bytesRead = -1;
                byte[] buffer = new byte[4096];
                while ((bytesRead = inputStream1.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                inputStream1.close();
                outputStream.close();
                System.out.println("File saved");
            }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void updateDP(String username,InputStream inputStream)
	{
		try
		{
			System.out.println("\nFetching database for updatingDP...");
			ps=con.prepareStatement("update users set DP = ? where username = '"+username+"'");
			ps.setBlob(1, inputStream);
		 	System.out.println("Updating DP...");
		 	ps.executeUpdate();
		 	System.out.println("DP Updated :)");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void updateInfo(String username, String name, String address, String city, String contact,String location)
	{
		try
		{
			System.out.println("\nFetching database for updateInfo...");
			ps=con.prepareStatement("update users set name = '"+name+"', address = '"+address+"', city = '"+city+"', contact = "+contact+", location = '"+location+"' where username = '"+username+"'");
		 	System.out.println("Updating Info...");
		 	ps.executeUpdate();
		 	System.out.println("Info Updated :)");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public boolean checkIfUserExists(String username)
	{
		try
		{
			System.out.println("\nFetching database for checkIfUserExists...");
			ps=con.prepareStatement("select * from users where username='"+username+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.isBeforeFirst()) return true;
			else return false;
		}
		catch(SQLException e)
		{
			return false;
		}	
	}
	public void createAccount(InputStream blob,String name,String email,String paswd,String contact,String address,String city,String location)
	{
		try
		{
			System.out.println("\nCreate Account...");
			ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?)");
		 	ps.setBlob(1,blob);
		 	ps.setString(2,name);
		 	ps.setString(3,email);
		 	ps.setString(4,paswd);
		 	ps.setString(5,contact);
		 	ps.setString(6,address);
		 	ps.setString(7,city);
		 	ps.setString(8,location);
			System.out.println("Creating Account...");
			ps.executeUpdate();
			System.out.println("Creating Cart...");
			ps=con.prepareStatement("create table `"+email+"` (CartImage varchar(500) NOT NULL,CartItem varchar(70),ItemType varchar(40) NOT NULL,Price int NOT NULL,Quantity int NOT NULL,PRIMARY KEY (CartItem))");
			ps.executeUpdate();
			System.out.println("Creating Orders...");
			ps=con.prepareStatement("create table `"+email+"Orders`(OrderID varchar(20),SoldBy varchar(50) NOT NULL,ProductName varchar(70) NOT NULL,SubCategory varchar(30) NOT NULL,Quantity int NOT NULL,Price DECIMAL(11,2) NOT NULL,PaymentMethod varchar(30) NOT NULL,OrderDate DATE NOT NULL,PRIMARY KEY (OrderID))");
			ps.executeUpdate();
		 	System.out.println("All Done :)");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	public void updatePassword(String username,String password)
	{
		try
		{
			System.out.println("\nFetching database for updating password...");
			ps=con.prepareStatement("update users set pass = '"+password+"' where username = '"+username+"'");
		 	System.out.println("Updating Password...");
		 	ps.executeUpdate();
		 	System.out.println("Password Updated :)");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	public HashMap<String,ResultSet> getElectronicItems()
	{
		try 
		{
			System.out.println("\nFetching database for Electronic Items...");
			ps=con.prepareStatement("select types from electronics");
			ResultSet rs=ps.executeQuery();
			HashMap<String,ResultSet> a=new HashMap<String,ResultSet>();
			while(rs.next())
			{
				ResultSet r=null;
				try
				{
					
					ps=con.prepareStatement("select * from "+rs.getString(1).toLowerCase());
					r=ps.executeQuery();
				}
				catch(Exception p){}
				System.out.println("Fetching database for "+rs.getString(1).toLowerCase()+"..."+r);
				a.put(rs.getString(1).toLowerCase(),r);
			}
			return a;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public HashMap<String,ResultSet> getGadgets()
	{
		try 
		{
			System.out.println("\nFetching database for Gadgets...");
			ps=con.prepareStatement("select types from gadgets");
			ResultSet rs=ps.executeQuery();
			HashMap<String,ResultSet> a=new HashMap<String,ResultSet>();
			while(rs.next())
			{
				ResultSet r=null;
				try
				{
					
					ps=con.prepareStatement("select * from "+rs.getString(1).toLowerCase());
					r=ps.executeQuery();
				}
				catch(Exception p){}
				System.out.println("Fetching database for "+rs.getString(1).toLowerCase()+"..."+r);
				a.put(rs.getString(1).toLowerCase(),r);
			}
			return a;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public HashMap<String,ResultSet> getGroceries()
	{
		try 
		{
			System.out.println("\nFetching database for Groceries...");
			ps=con.prepareStatement("select types from groceries");
			ResultSet rs=ps.executeQuery();
			HashMap<String,ResultSet> a=new HashMap<String,ResultSet>();
			while(rs.next())
			{
				ResultSet r=null;
				try
				{
					
					ps=con.prepareStatement("select * from "+rs.getString(1).toLowerCase());
					r=ps.executeQuery();
				}
				catch(Exception p){}
				System.out.println("Fetching database for "+rs.getString(1).toLowerCase()+"..."+r);
				a.put(rs.getString(1).toLowerCase(),r);
			}
			return a;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public HashMap<String,ResultSet> getHomeAndDecors()
	{
		try 
		{
			System.out.println("\nFetching database for HomeAndDecors...");
			ps=con.prepareStatement("select types from homeanddecors");
			ResultSet rs=ps.executeQuery();
			HashMap<String,ResultSet> a=new HashMap<String,ResultSet>();
			while(rs.next())
			{
				ResultSet r=null;
				try
				{
					
					ps=con.prepareStatement("select * from "+rs.getString(1).toLowerCase());
					r=ps.executeQuery();
				}
				catch(Exception p){}
				System.out.println("Fetching database for "+rs.getString(1).toLowerCase()+"..."+r);
				a.put(rs.getString(1).toLowerCase(),r);
			}
			return a;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public HashMap<String,ResultSet> getClothing()
	{
		try 
		{
			System.out.println("\nFetching database for Clothing...");
			ps=con.prepareStatement("select types from clothing");
			ResultSet rs=ps.executeQuery();
			HashMap<String,ResultSet> a=new HashMap<String,ResultSet>();
			while(rs.next())
			{
				ResultSet r=null;
				try
				{
					
					ps=con.prepareStatement("select * from "+rs.getString(1).toLowerCase());
					r=ps.executeQuery();
				}
				catch(Exception p){}
				System.out.println("Fetching database for "+rs.getString(1).toLowerCase()+"..."+r);
				a.put(rs.getString(1).toLowerCase(),r);
			}
			return a;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public HashMap<String,ResultSet> getAllCategories()
	{
		try 
		{
			System.out.println("\nFetching database for All Categories...");
			ps=con.prepareStatement("select * from category");
			ResultSet rs=ps.executeQuery();
			HashMap<String,ResultSet> a=new HashMap<String,ResultSet>();
			while(rs.next())
			{
				ResultSet r=null;
				try
				{
					
					ps=con.prepareStatement("select * from "+rs.getString(1).toLowerCase());
					r=ps.executeQuery();
				}
				catch(Exception p){}
				System.out.println("Fetching database for "+rs.getString(1).toLowerCase()+"..."+r);
				a.put(rs.getString(1).toLowerCase(),r);
			}
			return a;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public ResultSet getCategories()
	{
		try 
		{
			System.out.println("\nFetching database Categories...");
			ps=con.prepareStatement("select * from category");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public void addNewShop(String email,String name,String city,String adds,String catg,String location)
	{
		try 
		{
			System.out.println("\nFetching database for addNewShop...");
			ps=con.prepareStatement("insert into shopinfo values('"+name+"','"+city+"','"+adds+"','"+email+"','"+catg+"','"+location+"')");
			ps.executeUpdate();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	@SuppressWarnings("resource")
	public void addNewProduct(String existing,String shop,String type,String catg,String link,String name,String description,String category,String price)
	{
		try 
		{
			System.out.println("\nFetching database for addNewProduct...");
			ResultSet rs;
			ps=con.prepareStatement("select shopcity from shopinfo where shopname='"+shop+"'");
			rs=ps.executeQuery();
			rs.next();
			String shopcity=rs.getString(1);
			if(existing==null)
			{
				try
				{
					ps=con.prepareStatement("select * from "+category);
					rs=ps.executeQuery();
				}
				catch(SQLException e)
				{
					ps=con.prepareStatement("create table "+category+" (ImageLink varchar(500) NOT NULL,ProductName varchar(70),Price int NOT NULL,Description varchar(500) NOT NULL,SubCategory varchar(40) NOT NULL,Availability varchar(500) NOT NULL,SoldBy	varchar(500) NOT NULL,PRIMARY KEY (ProductName))");
					ps.executeUpdate();
				}
				ps=con.prepareStatement("insert into "+category+" values('"+link+"','"+name+"','"+price+"','"+description+"','"+category+"','"+shopcity+"','"+shop+"')");
				ps.executeUpdate();
			}
			else
			{
				ps=con.prepareStatement("select availability,soldby from "+catg+" where productname='"+existing+"'");
				rs=ps.executeQuery();
				rs.next();
				if(rs.getString(2).indexOf(shop)==-1)
				{
					if(rs.getString(2).equals(""))
					ps=con.prepareStatement("update "+catg+" set soldby='"+shop+"' where productname='"+existing+"'");
					else
					ps=con.prepareStatement("update "+catg+" set soldby='"+rs.getString(2)+", "+shop+"' where productname='"+existing+"'");
					ps.executeUpdate();
				}
				if(rs.getString(1).indexOf(shopcity)==-1)
				{
					if(rs.getString(1).equals(""))
					ps=con.prepareStatement("update "+catg+" set availability='"+shopcity+"' where productname='"+existing+"'");
					else
					ps=con.prepareStatement("update "+catg+" set availability='"+rs.getString(1)+", "+shopcity+"' where productname='"+existing+"'");
					ps.executeUpdate();
				}
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	public void deleteItem(String name,String type,String shop)
	{
		try 
		{
			System.out.println("\nFetching database for deleteItem...\n"+name+" "+type+" "+shop);
			ps=con.prepareStatement("select soldby from "+type+" where productname='"+name+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			String cshop[]=rs.getString(1).split(",");
			System.out.println("here");
			String ccity="",shp="";
			HashSet<String> h=new HashSet<String>();
			for(String i:cshop)
			{
				i=i.trim();
				if(!i.equals(shop) && !i.equals(""))
				{
					System.out.println("select shopcity from shopinfo where shopname='"+i+"'");
					ps=con.prepareStatement("select shopcity from shopinfo where shopname='"+i+"'");
					rs=ps.executeQuery();
					rs.next();
					int size=h.size();
					h.add(rs.getString(1));
					if(size!=h.size())
					ccity+=rs.getString(1)+", ";
					shp+=i+", ";
					System.out.println("here"+i+" "+ccity+" "+shp);
				}
			}
			if(shp.equals(""))
			{
				ps=con.prepareStatement("update "+type+" set availability='', soldby='' where productname='"+name+"'");
			}
			else
			{
				ps=con.prepareStatement("update "+type+" set availability='"+ccity.substring(0,ccity.length()-2)+"', soldby='"+shp.substring(0,shp.length()-2)+"' where productname='"+name+"'");
			}
			ps.executeUpdate();
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
	}
	public void deleteShop(String username,String shopname,String shoptype)
	{
		try 
		{
			System.out.println("\nFetching database for deleteShop...");
			ps=con.prepareStatement("select types from "+shoptype);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				try
				{
					ps=con.prepareStatement("select productname from "+rs.getString(1)+" where soldby like '%"+shopname+"%'");
					ResultSet r=ps.executeQuery();
					while(r.next())
					{
						deleteItem(r.getString(1),rs.getString(1),shopname);
					}
				}
				catch(SQLException e)
				{
					System.out.println("Skipped");
				}
			}
			if(shoptype.equals("Electronics"))
			{
				deleteShop(username,shopname,"Gadgets");
			}
			else if(shoptype.equals("Gadgets"))
			{
				return;
			}
			ps=con.prepareStatement("delete from shopinfo where shopname = '"+shopname+"' and shopowner = '"+username+"'");
			ps.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	public ResultSet getShopInfo(String username)
	{
		try 
		{
			System.out.println("\nFetching database for Shop Names...");
			ps=con.prepareStatement("select * from shopinfo where shopowner='"+username+"'");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public String getShopLocation(String shop)
	{
		try 
		{
			System.out.println("\nFetching database for Shop Location...");
			ps=con.prepareStatement("select location from shopinfo where shopname='"+shop+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);			
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public HashSet<ResultSet> getShopProducts(String shopname,String shoptype)
	{
		try 
		{
			System.out.println("\nFetching database for ShopProducts...");
			HashSet<ResultSet> h=new HashSet<ResultSet>();
			ps=con.prepareStatement("select types from "+shoptype);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ResultSet r=null;
				try
				{
					ps=con.prepareStatement("select * from "+rs.getString(1)+" where soldby like '%"+shopname+"%'");
					r=ps.executeQuery();
				}
				catch(Exception p){}
				System.out.println("Fetching database for "+rs.getString(1)+"..."+r);
				h.add(r);
			}
			if(shoptype.equalsIgnoreCase("electronics"))
			{
				ps=con.prepareStatement("select types from gadgets");
				rs=ps.executeQuery();
				while(rs.next())
				{
					ResultSet r=null;
					try
					{
						ps=con.prepareStatement("select * from "+rs.getString(1)+" where soldby like '%"+shopname+"%'");
						r=ps.executeQuery();
					}
					catch(Exception p){}
					System.out.println("Fetching database for "+rs.getString(1)+"..."+r);
					h.add(r);
				}
			}
			return h;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public ResultSet getGroceriesShops()
	{
		try 
		{
			System.out.println("\nFetching database for Groceries Shop Names...");
			ps=con.prepareStatement("select * from shopinfo where category='Groceries'");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public ResultSet getElectronicsShops()
	{
		try 
		{
			System.out.println("\nFetching database for Electronics Shop Names...");
			ps=con.prepareStatement("select * from shopinfo where category='Electronics'");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public ResultSet getHomeDecorsShops()
	{
		try 
		{
			System.out.println("\nFetching database for HomeAndDecors Shop Names...");
			ps=con.prepareStatement("select * from shopinfo where category='HomeAndDecors'");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public ResultSet getClothingShops()
	{
		try 
		{
			System.out.println("\nFetching database for Clothing Shop Names...");
			ps=con.prepareStatement("select * from shopinfo where category='Clothing'");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	public String getUserCity(Object username)
	{
		try
		{
			System.out.println("\nFetching database for getUserCity...");
			if(username==null) throw new SQLException();
			ps=con.prepareStatement("select city from users where username='"+(String)username+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}
		catch(SQLException e)
		{
			return null;
		}
	}
	public String getUserAddress(String username)
	{
		try
		{
			System.out.println("\nFetching database for getUserAddress...");
			if(username==null) throw new SQLException();
			ps=con.prepareStatement("select address from users where username='"+username+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}
		catch(SQLException e)
		{
			return null;
		}
	}
	public String getUserContact(String username)
	{
		try
		{
			System.out.println("\nFetching database for getUserContact...");
			if(username==null) throw new SQLException();
			ps=con.prepareStatement("select contact from users where username='"+username+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}
		catch(SQLException e)
		{
			return null;
		}
	}
	public String getUserLocation(String username)
	{
		try
		{
			System.out.println("\nFetching database for getUserLocation...");
			if(username==null) throw new SQLException();
			ps=con.prepareStatement("select location from users where username='"+username+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}
		catch(SQLException e)
		{
			return null;
		}
	}
	public boolean addToCart(String username,String productImg,String productName,String productType,String productPrice,String quantity)
	{
		try
		{
			System.out.println("\nFetching database for addToCart...");
			ps=con.prepareStatement("select * from `"+username+"` where cartitem=\""+productName+"\"");
			ResultSet rs=ps.executeQuery();
			if(rs.isBeforeFirst()) 
			{
				rs.next();
				int q=rs.getInt(5)+Integer.parseInt(quantity);
				ps=con.prepareStatement("update `"+username+"` set `quantity`="+q+" where cartitem=\""+productName+"\"");
				ps.executeUpdate();
				return false;
			}
			else
			{
				ps=con.prepareStatement("insert into `"+username+"`(`CartImage`, `CartItem`, `ItemType`, `Price`, `Quantity`) VALUES (\""+productImg+"\",\""+productName+"\",'"+productType+"',"+productPrice+","+quantity+")");
				ps.executeUpdate();
				return true;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	public String getCartSubtotal(String username)
	{
		try
		{
			if(username==null) username="random"; 
			System.out.println("\nFetching database for getCartSubtotal...");
			ps=con.prepareStatement("select `Price`, `Quantity` from `"+username+"`");
			ResultSet rs=ps.executeQuery();
			int count=0,i=0;
			while(rs.next())
			{
				count+=rs.getInt(1)*rs.getInt(2);
				i++;
			}
			if(i<=1) return count+" ("+i+" item)";
			else return count+" ("+i+" items)";
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public void doCartChanges(String username,String name,String operand)
	{
		try
		{
			System.out.println("\nFetching database for doCartChanges...");
			ps=con.prepareStatement("SELECT `Quantity` FROM `"+username+"` WHERE `CartItem`='"+name+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			if(operand.equals("+"))
			{
				ps=con.prepareStatement("UPDATE `"+username+"` SET `Quantity`="+(rs.getInt(1)+1)+" WHERE `CartItem`='"+name+"'");
				ps.executeUpdate();
			}
			else if(operand.equals("-"))
			{
				if((rs.getInt(1)-1)==0)
				{
					ps=con.prepareStatement("DELETE FROM `"+username+"` WHERE `CartItem`='"+name+"'");
					ps.executeUpdate();
				}
				else
				{
					ps=con.prepareStatement("UPDATE `"+username+"` SET `Quantity`="+(rs.getInt(1)-1)+" WHERE `CartItem`='"+name+"'");
					ps.executeUpdate();
				}  
			}  
			else if(operand.equals("*"))
			{
				ps=con.prepareStatement("DELETE FROM `"+username+"` WHERE `CartItem`='"+name+"'");
				ps.executeUpdate();
			}			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	public ResultSet getCartItems(String username)
	{
		try
		{
			if(username==null) username="random"; 
			System.out.println("\nFetching database for getCartItems...");
			ps=con.prepareStatement("select * from `"+username+"`");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public String[] getShopsForItem(String item,String table)
	{
		try
		{
			System.out.println("\nFetching database for getShopsForItem...");
			ps=con.prepareStatement("select soldby from `"+table+"` where productname='"+item+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getString(1).split(",");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public double getDistance(String userLoc,String loc)
	{
		String[] l1=userLoc.split(",");
		double lat1=Double.parseDouble(l1[0].trim());
		double lon1=Double.parseDouble(l1[1].trim());
		
		String[] l2=loc.split(",");
        double lat2=Double.parseDouble(l2[0].trim());
        double lon2=Double.parseDouble(l2[1].trim());
        
		double dLat = Math.toRadians(lat2 - lat1); 
        double dLon = Math.toRadians(lon2 - lon1); 
  
        // convert to radians 
        lat1 = Math.toRadians(lat1); 
        lat2 = Math.toRadians(lat2); 
  
        // apply formulae 
        double a = Math.pow(Math.sin(dLat / 2), 2) +  
                   Math.pow(Math.sin(dLon / 2), 2) *  
                   Math.cos(lat1) *  
                   Math.cos(lat2); 
        double rad = 6371; 
        double c = 2 * Math.asin(Math.sqrt(a)); 
        return rad * c; 
	}
	public int getNewOrderNumber() 
	{
		try
		{
			System.out.println("\nFetching database for getNewOrderNumber...");
			ps=con.prepareStatement("select count(*) from `allorders`");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1)+1;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return 100;
		}
	}
	public ResultSet getOrders(String username) 
	{
		try
		{
			System.out.println("\nFetching database for getOrders...");
			ps=con.prepareStatement("select * from `"+username+"orders`");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public String getProductImage(String product,String category) 
	{
		try
		{
			System.out.println("\nFetching database for getProductImage...");
			ps=con.prepareStatement("select imagelink from `"+category+"` where productname='"+product+"'");
			ResultSet rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public void placeOrder(String OrderID,String SoldBy,String OrderedBy,String Product,String Category,int quantity,double price,String paymentvia,String date)
	{
		try
		{
			System.out.println("\nFetching database for placeOrder...");
			ps=con.prepareStatement("insert into `allorders` values('"+OrderID+"', '"+SoldBy+"', '"+OrderedBy+"', '"+Product+"', '"+Category+"', "+quantity+", "+price+", '"+paymentvia+"', '"+date+"')");
			ps.executeUpdate();
			System.out.println("Final Insertion");
			ps=con.prepareStatement("insert into `"+OrderedBy+"Orders` values('"+OrderID+"', '"+SoldBy+"', '"+Product+"', '"+Category+"', "+quantity+", "+price+", '"+paymentvia+"', '"+date+"')");
			ps.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	public void doRegularChecksAndUpdates()
	{
		try
		{
			ps=con.prepareStatement("select * from `category`");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ps=con.prepareStatement("select types from `"+rs.getString(1).toLowerCase()+"`");
				ResultSet r=ps.executeQuery();
				while(r.next())
				{
					try
					{
						ps=con.prepareStatement("select productname,soldby from `"+r.getString(1).toLowerCase()+"`");
						ResultSet s=ps.executeQuery();
						while(s.next())
						{
							String shops[]=s.getString(2).split(",");
							//String ccity="",shp="";
							//HashSet<String> h=new HashSet<String>();
							for(String i:shops)
							{
								i=i.trim();
								if(i.equals("")) continue;
								ps=con.prepareStatement("select shopcity from `shopinfo` where shopname='"+i+"'");
								//ResultSet p=ps.executeQuery();
								/*p.next();
								int size=h.size();
								h.add(p.getString(1));
								if(size!=h.size())
								ccity+=p.getString(1)+", ";
								shp+=i+", ";*/
								/*if(p.isBeforeFirst())
								{
									continue;
								}
								else
								{
									if(rs.getString(1).equals("Gadgets"))
									{
										ps=con.prepareStatement("insert into `shopinfo`(`ShopName`,`ShopOwner`,`Category`) values ('"+i+"','guriqbal.singh11@yahoo.in','Electronics')");
									}
									else
									{
										ps=con.prepareStatement("insert into `shopinfo`(`ShopName`,`ShopOwner`,`Category`) values ('"+i+"','guriqbal.singh11@yahoo.in','"+rs.getString(1)+"')");
									}
									System.out.println(i+" "+r.getString(1)+" "+s.getString(1));
									ps.executeUpdate();
								}*/
							}
							/*if(!shp.equals(""))
							{
								ps=con.prepareStatement("update "+r.getString(1).toLowerCase()+" set availability='"+ccity.substring(0,ccity.length()-2)+"', soldby='"+shp.substring(0,shp.length()-2)+"' where productname='"+s.getString(1)+"'");
								ps.executeUpdate();
								System.out.println("update "+r.getString(1).toLowerCase()+" set availability='"+ccity.substring(0,ccity.length()-2)+"', soldby='"+shp.substring(0,shp.length()-2)+"' where productname='"+s.getString(1)+"'");
							}*/
						}
					}
					catch(SQLException e)
					{
						System.out.println("Skipped "+r.getString(1));
					}
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	public static void main(String[] args)
	{
		Database d=new Database();
		d.doRegularChecksAndUpdates();
	}
}