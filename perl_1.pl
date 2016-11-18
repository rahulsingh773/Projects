sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

$page=" 			<html>
<head>
	<title>A html parser</title>
	<style>
		#id
		{
			hi:Atma;
		}
	</style>
</head>
<body>
	<h1>My Largest Heading</h1>
	<h2>My 2nd Largest Heading</h2>
	<h3>My 3rd Largest Heading</h3>
	<h4>My 4th Largest Heading</h4>
	<h5>My 5th Largest Heading</h5>
	<h6>My 6th Largest Heading</h6>
	<p>	Here we are using the equality operator == which is used to check if two operands are equal or not. 
      If both the operands are same, then it returns true otherwise it retruns false.
	</p>
	<a href='www.google.com'></a>
	
	<table>
		<tr>
			<td>Atma </td><td>Vidhani</td><td>13BIT003</td>
		</tr>
		<tr>
			<td>Rahul </td><td>Singh</td><td>13BIT043</td>
		</tr>
		<tr>
			<td>Malav </td><td>Shah </td><td>13BIT050</td>
		</tr>
		<tr>
			<td>Shreya</td><td>Patel</td><td>13BIT041</td>
		</tr>
		<tr>
			<td>Nikhil</td><td>Jain </td><td>13BEC067</td>
		</tr>
	</table>
	
	<a href='www.SkillsEnhancer.site50.net'></a>
	
	<a href='www.Facebook.com'></a>
	<table>
		<tr>
			<td>India     </td><td>New Delhi    </td>
		</tr>
		<tr>
			<td>USA       </td><td>Washington DC</td>
		</tr>
		<tr>
			<td>China     </td><td>Beijing      </td>
		</tr>
		<tr>
			<td>Pakistan  </td><td>Islamabad    </td>
		</tr>
		<tr>
			<td>SriLanka  </td><td>Colombo      </td>
		</tr>
		<tr>
			<td>Nepal     </td><td>Kathmandu    </td>
		</tr>
		<tr>
			<td>Bhutan    </td><td>Thimpu       </td>
		</tr>
		<tr>
			<td>Turkey    </td><td>Istanbul     </td>
		</tr>
		<tr>
			<td>Australia </td><td>Canberra     </td>
		</tr>
		<tr>
			<td>Japan    </td><td>Tokyo       </td>
		</tr>
		<tr>
			<td>England  </td><td>London      </td>
		</tr>
		
		<tr>
			<td>France   </td><td>Paris       </td>
		</tr>
		<tr>
			<td>Italy    </td><td>Dosa        </td>
		</tr>
		<tr>
			<td>Germany  </td><td>Munich      </td>
		</tr>
	</table>
</body>
</html>";

$page=trim($page);
$len=length($page);
$flag=1;
$tab=1;
#$count=0;
$row=1;
$col=1;
$hr=1;


while($len>0)
{
	$count=$count+1;
	
	$a=substr($page,0,1);
	if(($a eq "<")==false and $hr==0)
	{
		$b=index($page,"<");
		$x=substr($page,6,($b-8));
		$page=substr($page,$b);
		print "\n\n      HyperLink : $x\n";
	}
	elsif(($a eq "<")==false and $tab==1 )
		{
			$b=index($page,"<");
			$x=substr($page,0,$b);
			if($flag==1)
			{
				print "\n";
			}
			print "$x";
			$page=substr($page,$b);
			$page=trim($page);
			$len=length($page);
		}
		elsif(($a eq "<")==false and $tab==0)
		{
			$b=index($page,"<");
			$x=substr($page,0,$b);
			print "      row:$row,col:$col->$x";
			$page=substr($page,$b);
			$page=trim($page);
			$len=length($page);
		}
		else
		{
			if(substr($page,0,6) eq "<html>")
			{
				print "\n      HTML document starts!!!!\n";
				$page=substr($page,6);
				$page=trim($page);
				$len=length($page);
			}
			elsif(substr($page,0,6) eq "<head>")
			{
				print "\n      Header starts!!!!\n";
				$page=substr($page,6);
				$page=trim($page);
				$len=length($page);
			}
			elsif(substr($page,0,6) eq "<body>")
			{
				print "\n\n      Body starts!!!!\n";
				$page=substr($page,6);
				$page=trim($page);
				$len=length($page);
			}
			elsif(substr($page,0,7) eq "</head>")
			{
				print "\n\n      Header Ends!!!!";
				$page=substr($page,7);
				$page=trim($page);
				$len=length($page);
			}
			elsif(substr($page,0,7) eq "</body>")
			{
				print "\n\n      Body Ends!!!!";
				$page=substr($page,7);
				$page=trim($page);
				$len=length($page);
			}
			elsif(substr($page,0,7) eq "</html>")
			{
				print "\n\n      HTML Document Ends Here!!!!\n";
				print "\n      THANKS FOR USING !!!\n\n\n";
				$page=substr($page,7);
				$page=trim($page);
				$len=length($page);
			}
			elsif(substr($page,0,3) eq "<p>")
			{
				print "\n      Paragraph starts:-\n\n      ";
				$page=substr($page,3);
				$page=trim($page);
				$len=length($page);
				$flag=0;
			}
			elsif(substr($page,0,4) eq "</p>")
			{
				print "\n      Paragraph Ends!!!!";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=1;
			}
			elsif(substr($page,0,7) eq "<title>")
			{
				print "\n      Title:";
				$page=substr($page,7);
				$page=trim($page);
				$len=length($page);
				$flag=0;
			}
			elsif(substr($page,0,8) eq "</title>")
			{
				$page=substr($page,8);
				$page=trim($page);
				$len=length($page);
				$flag=1;	
			}
			elsif(substr($page,0,4) eq "<h1>")
			{
				print "\n      Heading 1:";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;	
			}
			elsif(substr($page,0,5) eq "</h1>")
			{
			print "\n";
				$page=substr($page,5);
				$page=trim($page);
				$len=length($page);
				$flag=1;	
			}
			elsif(substr($page,0,4) eq "<h2>")
			{
				print "\n      Heading 2:";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;	
			}
			elsif(substr($page,0,5) eq "</h2>")
			{
			print "\n";
				$page=substr($page,5);
				$page=trim($page);
				$len=length($page);
				$flag=1;	
			}
			elsif(substr($page,0,4) eq "<h3>")
			{
				print "\n      Heading 3:";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;	
			}
			elsif(substr($page,0,5) eq "</h3>")
			{
			print "\n";
				$page=substr($page,5);
				$page=trim($page);
				$len=length($page);
				$flag=1;	
			}
			elsif(substr($page,0,4) eq "<h4>")
			{
				print "\n      Heading 4:";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;	
			}
			elsif(substr($page,0,5) eq "</h4>")
			{
			print "\n";
				$page=substr($page,5);
				$page=trim($page);
				$len=length($page);
				$flag=1;	
			}
			elsif(substr($page,0,4) eq "<h5>")
			{
				print "\n      Heading 5:";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;	
			}
			elsif(substr($page,0,5) eq "</h5>")
			{
			print "\n";
				$page=substr($page,5);
				$page=trim($page);
				$len=length($page);
				$flag=1;	
			}
			elsif(substr($page,0,4) eq "<h6>")
			{
				print "\n      Heading 6:";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;	
			}
			elsif(substr($page,0,5) eq "</h6>")
			{
			print "\n Heading Ends\n";
				$page=substr($page,5);
				$page=trim($page);
				$len=length($page);
				$flag=1;	
			}
			elsif(substr($page,0,7) eq "<table>")
			{
				print "\n\n      Table:";
				$page=substr($page,7);
				$page=trim($page);
				$len=length($page);
				$flag=0;	
				$tab=0;
				$row=1;
				$col=1;
			}
			elsif(substr($page,0,8) eq "</table>")
			{
				print "\n";
				$page=substr($page,8);
				$page=trim($page);
				$len=length($page);
				$flag=0;	
				$tab=1;
				$row=1;
				$col=1;
			}
			elsif(substr($page,0,4) eq "<tr>")
			{
				print "\n";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;
				$col=1;
			}
			elsif(substr($page,0,5) eq "</tr>")
			{
				print "\n\n";
				$page=substr($page,5);
				$page=trim($page);
				$len=length($page);
				$flag=0;
				$row=$row+1;
				$col=1;
			}
			elsif(substr($page,0,4) eq "<td>")
			{
				print "\t";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;
			}
			elsif(substr($page,0,5) eq "</td>")
			{
				print "        |\t";
				$page=substr($page,5);
				$page=trim($page);
				$len=length($page);
				$flag=0;
				$col=$col+1;
			}
			elsif(substr($page,0,2) eq "<a")
			{
				print "\t";
				$page=substr($page,2);
				$page=trim($page);
				$len=length($page);
				$flag=0;
				$hr=0;
			}
			elsif(substr($page,0,4) eq "</a>")
			{
				print "\t";
				$page=substr($page,4);
				$page=trim($page);
				$len=length($page);
				$flag=0;
				$hr=1;
			}
			
			elsif(substr($page,0,7) eq "<style>")
			{
				print "\nCSS Starts\t\n";
				$page=substr($page,7);
				$page=trim($page);
				$len=length($page);
				$flag=0;
			}
			elsif(substr($page,0,8) eq "</style>")
			{
				print "   CSS ENDS  \t";
				$page=substr($page,8);
				$page=trim($page);
				$len=length($page);
				$flag=0;
				$col=$col+1;
			}
		}
}