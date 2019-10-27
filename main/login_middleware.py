from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import redirect


class MD1(MiddlewareMixin):
    def process_view(self, request, view_func, view_args, view_kwargs):
        path_list = [
            '/dashboard/',
            '/log/',
            '/profile/',
        ]
        if not request.session.get('user_id'):
            if request.path in path_list:
                return redirect('/login/')
