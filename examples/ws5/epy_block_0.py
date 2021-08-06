"""
Embedded Python Blocks:

Each time this file is saved, GRC will instantiate the first class it finds
to get ports and parameters of your block. The arguments to __init__  will
be the parameters. All of them are required to have default values!
"""

import numpy as np
from gnuradio import gr
import pmt
import cmath


class blk(gr.sync_block):  # other base classes are basic_block, decim_block, interp_block
    """Embedded Python Block example - a simple multiply const"""

    def __init__(self):  # only default arguments here
        """arguments to this function show up as parameters in GRC"""
        gr.sync_block.__init__(
            self,
            name='Phase Recovery by phase_est',   # will show up in GRC
            in_sig=[np.complex64],
            out_sig=[np.complex64]
        )
        
        # if an attribute with the same name as a parameter is found,
        # a callback is registered (properties work, too).
        #self.example_param = example_param
        self.set_tag_propagation_policy(gr.TPP_DONT)

    def work(self, input_items, output_items):
        tags = self.get_tags_in_window(0, 0, len(input_items[0]))
        phase_offset = 0
        index = 1
        for tag in tags:
        	if pmt.to_python(tag.key) == "phase_est":
        		phase_offset = pmt.to_python(tag.value)
        		
        		#print("obtained phase est", phase_offset)
        	else:
        		self.add_item_tag(0,tag.offset,
        				  tag.key,
        				  tag.value)
        		#index = index+1
        		
        output_items[0][:] = input_items[0]*cmath.rect(1,-phase_offset)
        return len(output_items[0])
