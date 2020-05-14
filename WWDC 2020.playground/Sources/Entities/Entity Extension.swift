import GameplayKit

extension GKEntity {
    var visualNode: SKNode? {
        guard let spriteComponent = self.component(ofType: VisualComponent.self) else {
            return nil
        }
        return spriteComponent.node
    }

    var target: GKEntity? {
        guard let aimingComponent = self.component(ofType: AimingComponent.self) else {
            return nil
        }
        return aimingComponent.target
    }

    func dealDamageTo(_ target: GKEntity) {
        guard let damageComponent = self.component(ofType: DamageComponent.self),
            let healthComponent = target.component(ofType: HealthComponent.self) else {
            return
        }
        healthComponent.takeDamageFrom(damageComponent)
    }

    func buy(_ value: Float) -> Bool {
        guard let moneyComponent = self.component(ofType: MoneyComponent.self) else {
            return false
        }
        return moneyComponent.spend(value)
    }

    func earn(_ value: Float) {
        guard let moneyComponent = self.component(ofType: MoneyComponent.self) else {
            return
        }
        moneyComponent.earn(value)
    }
}
