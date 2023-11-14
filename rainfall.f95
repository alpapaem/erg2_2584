program Rainfall
  implicit none
  integer :: i,Nmax,n,iostat
  character(100)::line
  character(20),dimension(50):: town
  integer,dimension(50):: rain

  ! Open file
  open(unit=10, file="data.txt", status='old', action='read')
    
  !read number of rows in file and rewind to the top
  Nmax=50
  n = 0
  do
    read(10, *, iostat=iostat) line
    if (iostat /= 0) exit  
    n = n + 1
  end do
  rewind(10)

   !read data and place into the arrays if number of rows is bellow 50
   if (n<=Nmax) then   
     read(10, *)
        
     do i = 1, n-1
       read(10, *) town(i), rain(i)
     end do

     do i = 1, n-1
       write(*,*) town(i), rain(i)
     end do
  end if
  
  if (n>Nmax) then
     print*,'Error: Number of Rows in file need to be at most 50'
  end if

  

 close(10)
 
end program Rainfall