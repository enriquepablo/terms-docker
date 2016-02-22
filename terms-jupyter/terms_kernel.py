import os
import re
import sys
import socket
from ipykernel.kernelbase import Kernel
from multiprocessing.connection import Client

IP_PAT = re.compile("^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$")


class TermsKernel(Kernel):
    implementation = 'Terms'
    implementation_version = '1.0'
    language = 'Terms'
    language_version = '0.1'
    language_info = {'name': 'Terms', 'mimetype': 'text/plain'}
    banner = "The Terms language"
    
    def __init__(self, *args, **kwargs):
        super(TermsKernel, self).__init__(*args, **kwargs)
        kb_host = os.environ['KB_HOST']
        if IP_PAT.match(kb_host):
            self.host  = kb_host
        else:
            try:
                address = socket.gethostbyname_ex(kb_host)
            except socket.gaierror:
                sys.exit('Cannot resolve hostname ' + kb_host)
            self.host = address[2][0]
        self.port = int(os.environ['KB_PORT'])

    def do_execute(self, code, silent, store_history=True, user_expressions=None,
                   allow_stdin=False):
        conn = Client((self.host, self.port))
        conn.send_bytes(bytes(code, 'UTF-8'))
        conn.send_bytes(bytes('FINISH-TERMS', 'UTF-8'))
        recv, resp = bytes(), str()
        while recv != b'END':
            if recv:
                resp += ', ' + recv.decode('UTF-8')
            recv = conn.recv_bytes()
        conn.close()
        if not silent:
            stream_content = {'name': 'stdout', 'text': resp}
            self.send_response(self.iopub_socket, 'stream', stream_content)

        return {'status': 'ok',
                # The base class increments the execution count
                'execution_count': self.execution_count,
                'payload': [],
                'user_expressions': {},
               }

if __name__ == '__main__':
    from ipykernel.kernelapp import IPKernelApp
    IPKernelApp.launch_instance(kernel_class=TermsKernel)
