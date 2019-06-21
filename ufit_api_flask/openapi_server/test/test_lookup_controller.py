# coding: utf-8

from __future__ import absolute_import
import unittest

from flask import json
from six import BytesIO

from openapi_server.models.exercise import Exercise  # noqa: E501
from openapi_server.test import BaseTestCase


class TestLookupController(BaseTestCase):
    """LookupController integration test stubs"""

    def test_find_exercises_by_tags(self):
        """Test case for find_exercises_by_tags

        Finds exercise by custom tag
        """
        headers = { 
            'Accept': 'application/json',
        }
        response = self.client.open(
            '/totus/ufit/0.0.1/library/exercise/{tags}'.format(tags='tags_example'),
            method='GET',
            headers=headers)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    unittest.main()
