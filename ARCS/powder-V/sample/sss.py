import os
import mcvine, mcvine.components as mcomps
instrument = mcvine.instrument()

here = os.path.dirname(__file__) or '.'
here = os.path.abspath(here)
beam = os.path.abspath(os.path.join(here, '../beam/out/beam.mcvine'))

source = mcomps.sources.NeutronFromStorage(name='source', path=beam)
instrument.append(source, position=(0.0, 0.0, -0.15), orientation=(0, 0, 0))

sample = mcomps.samples.SampleAssemblyFromXml(name='sample', sampleassembly_xml='sampleassembly/sampleassembly.xml')
instrument.append(sample, position=(0.0, 0.0, 0.0), orientation=(0, 0, 0))

save_neutrons = mcomps.monitors.NeutronToStorage(name='save_neutrons', path="scattered.mcvine")
instrument.append(save_neutrons, position=(0., 0., 0))
