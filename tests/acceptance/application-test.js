import { module, test } from 'qunit';
import { visit, click } from '@ember/test-helpers';
import { setupApplicationTest } from 'example/tests/helpers';

module('Acceptance | application', function (hooks) {
  setupApplicationTest(hooks);

  test('does not blow up', async function (assert) {
    assert.expect(0);

    await visit('/');
    await click('.open');
    await click('.close');
  });
});
