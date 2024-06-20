import Component from "@glimmer/component";
import { modifier as emberModifier } from "ember-modifier";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { on } from "@ember/modifier";
import { fn } from "@ember/helper";

const myModifier = emberModifier((element, [value]) => {
  console.log("running modifier", value);
});

export default class Foo extends Component {
  @tracked isOpen = false;
  @tracked value;

  @action
  open() {
    console.log("open");
    this.isOpen = true;
  }

  @action
  close() {
    console.log("close");
    this.isOpen = false;
    this.value = "foo";
  }

  <template>
    <p>
      To reproduce the error, click open, then close.
    </p>

    <button type="button" class="open" {{on "click" this.open}}>
      Open
    </button>

    <button
      type="button"
      class="close"
      {{on "click" this.close}}
    >
      Close
    </button>

    <div {{(if this.isOpen (modifier myModifier this.value))}}>
      Hello World
    </div>
  </template>
}
