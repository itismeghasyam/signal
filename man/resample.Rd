\name{resample}
\alias{resample}
\title{ Change the sampling rate of a signal }
\description{
  Resample using bandlimited interpolation.
}
\usage{
resample(x, p, q = 1, d = 5)
}
\arguments{
  \item{x}{ signal to be resampled. }
  \item{p, q}{ \code{p/q} specifies the factor to resample by. }
  \item{d}{ distance. }
}
\details{
Note that \code{p} and \code{q} do
not need to be integers since this routine does not use a polyphase
rate change algorithm, but instead uses bandlimited interpolation,
wherein the continuous time signal is estimated by summing the sinc
functions of the nearest neighbouring points up to distance \code{d}.

Note that resample computes all samples up to but not including time n+1. 
If you are increasing the sample rate, this means that it will
generate samples beyond the end of the time range of the original
signal. That is why \code{xf} must go all the way to 10.95 in the example below.

Nowadays, the signal version in Matlab and Octave contain more modern code for 
resample that has not been ported to the signal R package (yet).
}
\value{
  The resampled signal, an array of length \code{ceiling(length(x) * p / q)}.
}
\references{ 
J. O. Smith and P. Gossett (1984). A flexible sampling-rate
conversion method. In ICASSP-84, Volume II, pp. 19.4.1-19.4.2. 
New York: IEEE Press.

\url{http://dx.doi.org/10.1109/ICASSP.1984.1172555}

  Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{decimate}}, \code{\link{interp}} }
\examples{
xf <- seq(0, 10.95, by=0.05)
yf <- sin(2*pi*xf/5)
xp <- 0:10
yp <- sin(2*pi*xp/5)
r <- resample(yp, xp[2], xf[2])
title("confirm that the resampled function matches the original")
plot(xf, yf, type = "l", col = "blue")
lines(xf, r[1:length(xf)], col = "red")
points(xp,yp, pch = 19, col = "blue")
legend("bottomleft", c("Original", "Resample", "Data"),
       col = c("blue", "red", "blue"),
       pch = c(NA, NA, 19),
       lty = c(1, 1, NA), bty = "n")
}
\keyword{ math }
