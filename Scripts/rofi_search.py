#!/usr/bin/env python3

from typing import List
import copy
import subprocess
import sys

class RofiAmazonSearcher:
    ROFI_COMMAND = ['rofi', '-dmenu', '-p', 'Amazon Searcher']
    XDG_COMMAND = ['xdg-open']

    GOOGLE_PREFIX = 'https://www.google.com/search?q='

    def __init__(self) -> None:
        self.search_providers = {
            'goog': self.google_handler,
            'code': self.code_handler,
            'is'  : self.internal_handler,
            'ph'  : self.phone_tool_handler }

    def run(self) -> None:
        self.dispatch_rofi_for_user_input()
        search_input = self.get_tokenized_user_input()

        #default to internal search
        search_handler = self.internal_handler
        if len(search_input) == 2:
            search_prefix, self.search_string = search_input
            search_handler = self.search_providers[search_prefix]
            if search_handler is None:
                sys.err.write('no search handler found')
                sys.exit()
        else:
            self.search_string = search_input[0]

        formatted_search_link = search_handler()
        self.open_search_link(formatted_search_link)

    def dispatch_rofi_for_user_input(self) -> None:
        self.rofi_process = subprocess.run(self.ROFI_COMMAND, stdout=subprocess.PIPE,
                                           stdin=subprocess.DEVNULL)

    def get_tokenized_user_input(self) -> List[str]:
        return self.rofi_process.stdout.decode('utf-8', 'strict') \
                                       .strip('\n') \
                                       .split(maxsplit=1)

    def open_search_link(self, link_string) -> None:
        local_command = self.XDG_COMMAND.copy()
        local_command.append(link_string)
        self.rofi_process = subprocess.run(local_command, stdout=subprocess.PIPE,
                                           stdin=subprocess.DEVNULL)

    """ Replace any spaces with + """
    def google_handler(self) -> str:
        tokens = self.search_string.split()
        filtered_tokens = filter(lambda x : len(x) > 0, tokens)
        escaped_search = ''
        for token in filtered_tokens:
            escaped_search = escaped_search + '+' + token

        return self.GOOGLE_PREFIX + escaped_search

    def code_handler(self) -> str:
        sys.exit()
        return self.search_string

    def internal_handler(self) -> str:
        sys.exit()
        return self.search_string

    def phone_tool_handler(self) -> str:
        sys.exit()
        return self.search_string


    @classmethod
    def main(cls) -> None:
        searcher = RofiAmazonSearcher()
        searcher.run()

if __name__ == '__main__':
    RofiAmazonSearcher.main()
