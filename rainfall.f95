program rainfall
  implicit none
  integer :: i
  character(20),dimension(5) :: town
  integer,dimension(5):: rain

  ! Open file
  open(unit=10, file="data.txt", status='old', action='read')


  !read Header
  read(10, *)  

  !read data
  do i = 1, 5
    read(10, *) town(i), rain(i)
  end do

  !print data
  do i = 1, 5
    write(*,*) town(i), rain(i)
  end do

  close(10)

end program