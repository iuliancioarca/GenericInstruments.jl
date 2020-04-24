# GenericInstruments

[![Build Status](https://travis-ci.com/iuliancioarca/GenericInstruments.jl.svg?branch=master)](https://travis-ci.com/iuliancioarca/GenericInstruments.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/iuliancioarca/GenericInstruments.jl?svg=true)](https://ci.appveyor.com/project/iuliancioarca/GenericInstruments-jl)
[![Codecov](https://codecov.io/gh/iuliancioarca/GenericInstruments.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/iuliancioarca/GenericInstruments.jl)
[![Coveralls](https://coveralls.io/repos/github/iuliancioarca/GenericInstruments.jl/badge.svg?branch=master)](https://coveralls.io/github/iuliancioarca/GenericInstruments.jl?branch=master)

Based on https://github.com/BBN-Q/Instruments.jl. Bundles similar functionalities of instruments under a single generic object: power supplies, arbitrary waveform generators, etc.

Please install the following before adding this package:
1. Install NIVISA (currently tested only on Windows)
2. Install PXI instrument drivers (if needed; currently supports scopes such as NI5122/5114)
4. ]add GenericInstruments
5. using GenericInstruments

Supported instruments:
1. Scope: Lecroy 6054A (should work for the entire 6xxx-8xxx series), NIScope 5122/5114/5152
2. Arbitrary waveform generators: Agilent 33500 series dual channel, Agilent 33250A single channel
3. Power supplies: Agilent E36xx series, single or dual channel (E3645/E3646/E3649)
4. Digital multimeters: WIP on Ketihley 2000/20001/7510

See examples folder for usage
