// package envutil provides utility functions for working with environment variables.
package envutil

import (
	"os"
	"strings"
)

// Environ returns the environment as a map.
func Environ() map[string]string {
	return FromEnviron(os.Environ())
}

// FromEnviron returns a map from a given set of environment vars.
func FromEnviron(e []string) map[string]string {
	ret := map[string]string{}
	for _, pair := range e {
		parts := strings.SplitN(pair, "=", 2)
		if len(parts) == 2 {
			ret[parts[0]] = parts[1]
		}
	}
	return ret
}
