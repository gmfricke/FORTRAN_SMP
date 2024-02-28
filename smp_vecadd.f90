! Program to add up elements of an array
program serial_array_sum
  USE OMP_LIB
  implicit none

! Declare variables, N is the size of the array
  ! Array holds the data to sum
  INTEGER :: N,i
  CHARACTER(LEN=100) :: arg
  REAL, ALLOCATABLE :: a(:), b(:), c(:)
    
  call GET_COMMAND_ARGUMENT(1, arg)
  read(arg,*) N
  ALLOCATE(a(N))
  ALLOCATE(b(N))
  ALLOCATE(c(N))
  
  call RANDOM_NUMBER(b)
  call RANDOM_NUMBER(c)
    
  !$OMP PARALLEL PRIVATE(i)
  !$OMP DO 
  do i=1,N
    a(i) = b(i) + c(i)
  end do
  !$OMP END DO 
  !$OMP END PARALLEL
  
end program serial_array_sum
