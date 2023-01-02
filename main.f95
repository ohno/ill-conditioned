program main

  implicit none
  integer          :: n
  real             :: FrankSingle, HilbertSingle
  double precision :: FrankDouble, HilbertDouble

  print '("Frank matrix")'
  do n = 1,3
    print '("n = ", i0)', 10**n
    print *, "SSYEV", FrankSingle(10**n)
    print *, "DSYEV", FrankDouble(10**n)
  end do

  print '("Hilbert matrix")'
  do n = 1,6
    print '("n = ", i0)', n 
    print *, "SSYEV", HilbertSingle(n)
    print *, "DSYEV", HilbertDouble(n)
  end do

end program main

function FrankSingle(n)
  implicit none
  real    :: FrankSingle ! function
  integer :: n           ! argument
  integer :: i, j        ! loop counter
  real    :: A(n, n)     ! matrix of eigenvectors c(:,1), c(:,2), c(:,3),...
  real    :: W(n)        ! vector of eigenvalues E(1), E(2), E(3),...
  real    :: WORK(3*n-1) ! working memory
  integer :: INFO        ! exit code

  do j = 1,n
    do i = 1,n
      A(i,j) = n - max(i,j) + 1 ! Frank matrix
    end do
  end do

  call SSYEV('V', 'U', n, A, n, W, WORK, 3*n-1, INFO) ! https://netlib.org/lapack/explore-html/d3/d88/group__real_s_yeigen_ga63d8d12aef8f2711d711d9e6bd833e46.html

  FrankSingle = W(1)
end function

function FrankDouble(n)
  implicit none
  double precision :: FrankDouble ! function
  integer          :: n           ! argument
  integer          :: i, j        ! loop counter
  double precision :: A(n, n)     ! matrix of eigenvectors c(:,1), c(:,2), c(:,3),... of eigenvectors c(:,1), c(:,2), c(:,3),...
  double precision :: W(n)        ! vector of eigenvalues E(1), E(2), E(3),...
  double precision :: WORK(3*n-1) ! working memory
  integer          :: INFO        ! exit code

  do j = 1,n
    do i = 1,n
      A(i,j) = n - max(i,j) + 1 ! Frank matrix
    end do
  end do

  call DSYEV('V', 'U', n, A, n, W, WORK, 3*n-1, INFO) ! https://netlib.org/lapack/explore-html/d2/d8a/group__double_s_yeigen_ga442c43fca5493590f8f26cf42fed4044.html

  FrankDouble = W(1)
end function

function HilbertSingle(n)
  implicit none
  real    :: HilbertSingle ! function
  integer :: n             ! argument
  integer :: i, j          ! loop counter
  real    :: A(n, n)       ! matrix of eigenvectors c(:,1), c(:,2), c(:,3),...
  real    :: W(n)          ! vector of eigenvalues E(1), E(2), E(3),...
  real    :: WORK(3*n-1)   ! working memory
  integer :: INFO          ! exit code

  do j = 1,n
    do i = 1,n
      A(i,j) = 1d0 / (i + j - 1) ! Hilbert matrix
    end do
  end do

  call SSYEV('V', 'U', n, A, n, W, WORK, 3*n-1, INFO) ! https://netlib.org/lapack/explore-html/d3/d88/group__real_s_yeigen_ga63d8d12aef8f2711d711d9e6bd833e46.html

  HilbertSingle = W(1)
end function

function HilbertDouble(n)
  implicit none
  double precision :: HilbertDouble ! function
  integer          :: n             ! argument
  integer          :: i, j          ! loop counter
  double precision :: A(n, n)       ! matrix of eigenvectors c(:,1), c(:,2), c(:,3),...
  double precision :: W(n)          ! vector of eigenvalues E(1), E(2), E(3),...
  double precision :: WORK(3*n-1)   ! working memory
  integer          :: INFO          ! exit code

  do j = 1,n
    do i = 1,n
      A(i,j) = 1d0 / (i + j - 1) ! Hilbert matrix
    end do
  end do

  call DSYEV('V', 'U', n, A, n, W, WORK, 3*n-1, INFO) ! https://netlib.org/lapack/explore-html/d2/d8a/group__double_s_yeigen_ga442c43fca5493590f8f26cf42fed4044.html

  HilbertDouble = W(1)
end function