// Package x provides a bunch of random utilities that may or may not actually work at any given time.
//
// From the envutil package:
//     envmap := x.Environ()
package x

import (
	"github.com/cmattoon/x/envutil"
)

/**
 * envutil functions
 */

// Environ() returns os.Environ() as a map.
func Environ() map[string]string {
	return envutil.Environ()
}
