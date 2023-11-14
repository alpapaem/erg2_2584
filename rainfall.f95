program Rainfall
  implicit none
  integer :: i,Nmax,rows,iostat,N
  character(100)::line
  character(20),dimension(:),allocatable:: T
  integer,dimension(:),allocatable:: R

  ! Open file
  open(unit=10, file="data.txt", status='old', action='read')
 
  !read the number of rows inside the file and at the end rewind to the top
  rows = 0
  do
    read(10, *, iostat=iostat) line
    if (iostat /= 0) exit  
    rows = rows + 1
  end do
  rewind(10)

  !ask for the Nmax
  write(*,*) 'Give Max number of Rows (Nmax) you want without the Header'
  read(*,*) Nmax

  !check the requested size of Nmax
  If (Nmax<=rows) then
     allocate (T(Nmax))                        !allocate Arrays
     allocate (R(Nmax))
     
     call FillArrays(Nmax,T,R)                   !call subroutine 
 
     do i = 1, Nmax                              !print results
       write(*,*) T(i), R(i)
     end do
     write(*,*) 'The number of items in each Array is',N
  end if

  If (Nmax>rows) then
    write(*,*) 'Error: Nmax is bigger than the number of rows in the data.txt file'
  end if

 close(10)
 
 contains                                  !subroutine
 
 subroutine FillArrays(Nmax,T,R)
     integer::Nmax,i
     character(20),dimension(Nmax):: T
     integer,dimension(Nmax):: R
     
     read(10, *)
     N=0
     do i = 1, Nmax
       read(10, *) T(i), R(i)
       N=N+1
     end do
 end subroutine FillArrays


end program Rainfall