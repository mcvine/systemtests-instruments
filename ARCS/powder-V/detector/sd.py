import os
import mcvine, mcvine.components as mcomps
instrument = mcvine.instrument()

here = os.path.dirname(__file__) or '.'
here = os.path.abspath(here)
scattered = os.path.abspath(os.path.join(here, '../sample/out/scattered.mcvine'))

source = mcomps.sources.NeutronFromStorage(name='source', path=scattered)
instrument.append(source, position=(0.0, 0.0, 0.0), orientation=(0, 0, 0))

import mcvine.resources
arcs_res = mcvine.resources.instrument('ARCS')
xml = os.path.join(arcs_res, 'detsys', 'ARCS.xml.fornxs')
detector = mcomps.detectors.DetectorSystemFromXml(
    name='detector', instrumentxml=xml, tofparams=(0, 0.02, 1e-6), outfilename='arcs.dat')
instrument.append(detector, position=(0.0, 0.0, 0.0), orientation=(0, 0, 0))
