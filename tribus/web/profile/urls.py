from django.conf.urls import patterns, url
from django.contrib.auth.views import *
#from tribus.web.profile import views

urlpatterns = patterns('',
	url(r'^profile$', 'tribus.web.profile.views.UserProfile'),    
    url(r'^settings$', 'tribus.web.profile.views.EditUserProfile'),

    url(r'^settings/edition/done$', 'tribus.web.profile.views.EditUserProfile'),

    url(r'^settings/edition$', 'tribus.web.profile.views.EditUserProfile'),

    url(#r'^settings/changepassword/done$',
        r'^settings/changepassword/done$',
        view='django.contrib.auth.views.password_change_done',
        kwargs={
            'template_name': 'profile/change_password_done.html'
        },
    ),    

    url(r'^settings/changepassword$',view='django.contrib.auth.views.password_change',
        kwargs={
            'template_name': 'profile/change_password_form.html',
            'post_change_redirect': 'settings/changepassword/done',
            'password_change_form': PasswordChangeForm
        },
    ),



    )
